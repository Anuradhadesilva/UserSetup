//
//  ProfileViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 31/01/2024.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class ProfileViewModel:ObservableObject{
    init(){
        
    }
    @Published var user:User? = nil
    @Published var userId:String?
    @Published var StatusMessage = ""
    
    func fetchUser(){
        guard let user = Auth.auth().currentUser else{
            return
        }
        self.user = User(
            id: user.uid,
            name: user.displayName ?? "",
            email: user.email ?? "",
            profileImageURL: user.photoURL ?? nil
        )
        
        let profileImageRef = Storage.storage().reference().child("UserProfileImages").child("\(user.uid)"+".jpg")
        profileImageRef.downloadURL { url, error in
            if let error = error {
                print("Error fetching profile image URL: \(error.localizedDescription)")
                return
            }
            
            if let url = url {
                let profileImageURL = URL(string: url.absoluteString)
                let user = User(id: user.uid,
                                name: user.displayName ?? "",
                                email: user.email ?? "",
                                profileImageURL: profileImageURL ?? user.photoURL)
                self.user = user
            }
            
            
            
        }
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
    func profileLoadController(image :UIImage?){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let profileImageRef = Storage.storage().reference().child("UserProfileImages").child("\(uid)"+".jpg")
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        
        profileImageRef.putData(imageData, metadata: nil){ metadata, err in
            if let err = err {
                self.StatusMessage = "Failed to push image to Storage: \(err)"
                print(self.StatusMessage)
                return
            }
            self.fetchUser()
        }
    }
        
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        } catch{
            print(error)
        }
    }
}

