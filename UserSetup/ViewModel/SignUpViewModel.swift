//
//  SignUpViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 26/01/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignUpViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var isUserSignedUp = false
    @Published var isUserExisting = false
    
    init(){
        
    }
    @Published var user:User? = nil
    @Published var userId:String?
    
    func Register(){
        guard Validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            if let error = error {
                self?.showAlert = true
                self?.isUserExisting = true
            }
            self?.isUserSignedUp = true
            self?.insertUserRecord(id: userId)
        }
    }
    private func insertUserRecord(id:String){
        let newUser = User(
            id: id,
            name: name,
            email: email, 
            profileImageURL: nil
        )
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func Validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
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
        guard password.count >= 6 else{
            showAlert = true
            errorMessage = "password must be atleast 5 characters"
            return false
        }
        return true
    }
    
}
