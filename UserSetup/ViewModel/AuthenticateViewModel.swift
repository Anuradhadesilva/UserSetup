//
//  AuthenticateViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 26/01/2024.
//

import Foundation
import FirebaseAuth

class AuthenticateViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
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
    
}
