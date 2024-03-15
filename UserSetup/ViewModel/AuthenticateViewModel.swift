//
//  AuthenticateViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 26/01/2024.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit

@MainActor
class AuthenticateViewModel:NSObject,ObservableObject {
    @Published var currentUserId: String = ""
    @Published var errorMessage: String = ""
    @Published var isLogIn:Bool = false
    @Published var isLogInApple:Bool = false
    @Published var oldUserGoogle:Bool = false
    @Published var oldUserApple:Bool = false
    @Published var isConnectingApple:Bool = false
    @Published var isConnectingGoogle:Bool = false
    @Published var isUserSignedUp = false
    fileprivate var currentNonce: String?
    
    static let sharedInstance = AuthenticateViewModel()
    public var handler:AuthStateDidChangeListenerHandle?
    
    override init(){
        super.init()
        self.handler = Auth.auth().addStateDidChangeListener {[weak self]_, user in
            DispatchQueue.main.async
            {
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
    
    func appleSignIn() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.presentationContextProvider = UIApplication.shared.windows.last?.rootViewController as? ASAuthorizationControllerPresentationContextProviding
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    // MARK: Some utilities
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}

extension AuthenticateViewModel{
    func signInWithGoogle() async -> Bool{
        guard let clientID = FirebaseApp.app()?.options.clientID else{
            fatalError("No Client Id found in firebase configuration")
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScence = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScence.windows.first,
              let rootViewController = await window.rootViewController else {
            print("Their is no root view controller")
            return false
        }
        do{
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                
                return false
            }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                                       accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            self.isLogIn = true
            if result.additionalUserInfo?.isNewUser ?? false{
                self.isUserSignedUp = true
            } else{
                self.oldUserGoogle = true
            }
            self.isConnectingGoogle = false
//            self.currentUserId = result.user.uid
            let firebaseUser = User(id: result.user.uid, name: result.user.displayName ?? "unknown", email: result.user.email ?? "unknown", profileImageURL: result.user.photoURL?.absoluteURL )
//            let firebaseUser = result.user
            print("User \(firebaseUser.id) signed in with email \(firebaseUser.email )")
            return true
            
        } catch {
            isConnectingGoogle = false
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            return false
        }
         
    }
}

extension AuthenticateViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print("WE ARE HERE!")
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            // Initialize a Firebase credential.
            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            // Sign in with Firebase.
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                    // you're sending the SHA256-hashed nonce as a hex string with
                    // your request to Apple.
                    print(error.localizedDescription)
                    return
                }
                self.currentUserId = authResult?.user.uid ?? ""
                if authResult?.additionalUserInfo?.isNewUser ?? false{
                    self.isLogInApple = true
                    self.isUserSignedUp = true
                }else
                {
                    self.oldUserApple = true
                    self.isLogInApple = true
                }
                
                self.isConnectingApple = false
                // User is signed in to Firebase with Apple.
                // ...
                print("User is now connected")
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Error Signing in with Apple ID: \(error.localizedDescription)")
        isConnectingApple = false
    }
}

//extension AuthenticateViewModel {
//    func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
//        request.requestedScopes = [.fullName, .email]
//        let nonce = randomNonceString()
//        currentNonce = nonce
//        request.nonce = sha256(nonce)
//      }
//
//    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
//        if case .failure(let failure) = result {
//            errorMessage = failure.localizedDescription
//        }
//        else if case .success(let authorization) = result {
//            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//                guard let nonce = currentNonce else {
//                    fatalError("Invalid state: a login callback was received, but no login request was sent.")
//                }
//                guard let appleIDToken = appleIDCredential.identityToken else {
//                    print("Unable to fetdch identify token.")
//                    return
//                }
//                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//                    print("Unable to serialise token string from data: \(appleIDToken.debugDescription)")
//                    return
//                }
//                
//                let credential = OAuthProvider.credential(withProviderID: "apple.com",
//                                                          idToken: idTokenString,
//                                                          rawNonce: nonce)
//                Task {
//                    do {
//                        let result = try await Auth.auth().signIn(with: credential)
////                                        await updateDisplayName(for: result.user, with: appleIDCredential)
//                    }
//                    catch {
//                        print("Error authenticating: \(error.localizedDescription)")
//                    }
//                }
//            }
//        }
//    }
//
//          
//    func verifySignInWithAppleAuthenticationState() {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let providerData = Auth.auth().currentUser?.providerData
//        if let appleProviderData = providerData?.first(where: { $0.providerID == "apple.com" }) {
//          Task {
//            do {
//              let credentialState = try await appleIDProvider.credentialState(forUserID: appleProviderData.uid)
//              switch credentialState {
//              case .authorized:
//                break // The Apple ID credential is valid.
//              case .revoked, .notFound:
//                // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
//                  self.isSignedIn
//              default:
//                break
//              }
//            }
//            catch {
//            }
//          }
//        }
//      }
//}

extension ASAuthorizationAppleIDCredential {
  func displayName() -> String {
    return [self.fullName?.givenName, self.fullName?.familyName]
      .compactMap( {$0})
      .joined(separator: " ")
  }
}

private func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: [Character] =
  Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError(
          "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}

@available(iOS 13, *)
private func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}
     
