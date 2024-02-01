//
//  UserSetupApp.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI
import FirebaseCore
@main
struct UserSetupApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
