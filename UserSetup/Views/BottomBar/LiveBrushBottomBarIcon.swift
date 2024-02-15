//
//  LiveBrushBottomBarIcon.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 13/02/2024.
//

import SwiftUI

struct LiveBrushBottomBarIcon: View {
    let imageName:String
    let imageTName:String
    let labelName:String
    
    let isSelected:Bool
    var body: some View {
        ZStack(alignment:.bottom){
            Group{
                Image(imageName)
                    .resizable()
                    .frame(width: 30, height: 80)
                
                Image(imageTName)
                    .resizable()
                    .frame(width: 30, height: 50)
                    .cornerRadius(8)
                   
                    
//                Image(imageTName)
//                    .renderingMode(.template)
//                    .resizable()
//                    .frame(width: 30, height: 80)
                
                    
            }
            .offset(y: isSelected ? -20:0)
            .padding()
            Text(labelName)
                .foregroundStyle(isSelected ? .purple :. white)
                .frame(width: 60, height: 43)
                .background(Color(UIColor(red: 20/255, green: 20/255, blue: 22/255, alpha: 1.0)))
                .offset(y:8)
            
        }
        .frame(width: 60)
      
        
    }
}

//
//#Preview {
//    LiveBrushBottomBarIcon(imageName: <#String#>, labelName: <#String#>)
//}
