//
//  BottomBarIconView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 12/02/2024.
//

import SwiftUI

struct BottomBarIconView: View {
    let image:String
    let lable:String
    let isSelected:Bool
    let action:() -> Void
    var body: some View {
        VStack{
            Image(systemName: image)
                .resizable()
                .foregroundColor(isSelected ? Color.purple : Color.gray)
                .frame(width: 25, height: 25)
                
            Text(lable)
                .foregroundColor(isSelected ? Color.purple : Color.gray)
        }
        .padding()
        .onTapGesture{
            action()
        }
    }
        
}


