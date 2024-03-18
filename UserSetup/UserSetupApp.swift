//
//  UserSetupApp.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
//      Auth.auth().useEmulator(withHost: "localHost", port: 9099)
    return true
  }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct UserSetupApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView(profileViewModel: ProfileViewModel(), signInModel: SignInViewModel(), signUpModel: SignUpViewModel(), authViewModel: AuthenticateViewModel(), mainViewModel: MainViewModel())
        }
    }
}
