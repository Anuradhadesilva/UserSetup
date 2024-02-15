//
//  ImageArtViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 31/01/2024.
//

import Foundation


class ImageArtViewModel:ObservableObject{
    struct ImageData{
        var imageName:String
        var text:String
    }
    let ImageArray :[ImageData] = [
        ImageData(imageName: "Pot", text: "Untitled1"),
        ImageData(imageName: "Shoe", text: "Untitled2"),
        ImageData(imageName: "Desk", text: "Untitled3"),
        ImageData(imageName: "Watch", text: "Untitled4"),
        ImageData(imageName: "Car", text: "Untitled5"),
        ImageData(imageName: "upload", text: "unknown")
    ]
    
    let ImageArray2 :[ImageData] = [
        ImageData(imageName: "Girl", text: "Untitled1"),
        ImageData(imageName: "Purple", text: "Untitled2"),
        ImageData(imageName: "Pot", text: "Untitled3"),
        ImageData(imageName: "Watch", text: "Untitled4"),
        ImageData(imageName: "Shoe", text: "Untitled5"),
        ImageData(imageName: "upload", text: "unknown")
    ]

    
}
