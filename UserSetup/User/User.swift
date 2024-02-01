//
//  User.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 26/01/2024.
//

import Foundation

struct User:Identifiable,Codable{
    let id: String
    let name:String
    let email:String
}
