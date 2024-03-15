//
//  SignInViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 26/01/2024.
//

import Foundation
import FirebaseAuth

class SignInViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage =  ""
    @Published var validEmail = false
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        print("User Login successfully. Email: \(email)")
    }
    
     private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all field"
                  return false
              }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
}

