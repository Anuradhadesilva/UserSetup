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
    @Published var invalidLogin = false
    @Published var showAlert = false
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password){[weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                showAlert = true
                invalidLogin = true
            }
            
        }
        print("User Login successfully. Email: \(email)")
    }
    
     private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            showAlert = true
            errorMessage = "Please fill all field"
                  return false
              }
        guard email.contains("@") && email.contains(".") else{
            showAlert = true
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
}

