//
//  ProfileViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 31/01/2024.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel:ObservableObject{
    init(){
        
    }
    @Published var user:User? = nil
    @Published var userId:String?
    
    func fetchUser(){
        guard let user = Auth.auth().currentUser else{
            return
        }
        
        self.user = User(id: user.uid,
                         name: user.displayName ?? "",
                         email: user.email ?? "",
                         profileImageURL: user.photoURL)
//        let db = Firestore.firestore()
//        db.collection("users").document(userId).getDocument{[weak self] snapshot, error in
//            guard let data = snapshot?.data(), error == nil else{
//                return
//            }
//            
//            self?.user = User(
//                id: data["id"] as? String ?? "",
//                name: data["name"] as? String ?? "",
//                email:data["email"] as? String ?? "")
//            
//        }
        
        
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        } catch{
            print(error)
        }
    }
}

