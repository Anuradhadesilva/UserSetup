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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
//      Auth.auth().useEmulator(withHost: "localHost", port: 9099)
    return true
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
