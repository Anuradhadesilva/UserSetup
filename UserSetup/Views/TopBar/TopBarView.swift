//
//  TopBarView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 08/02/2024.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        VStack{
            ZStack(alignment:.bottom){
                HStack{
                    backButton
                    
                    Spacer()
                    
                    HStack{
                        undoIcon
                        resetIcon
                        redoIcon
                    }
                    
                    Spacer()
                    
                    doneIcon
                }
            }
         
            
        }
        
        
    }
    
    var backButton: some View{
        ZStack{
            TopBarIconView(imageName: "back_icon", tintColor: Color("#E2E3E4"))
        }
    }
    
    var undoIcon: some View{
        ZStack{
            TopBarIconView(imageName: "undo_icon", tintColor: Color("#E2E3E4"))
        }
    }
    
    var redoIcon: some View{
        ZStack{
            TopBarIconView(imageName: "redo_icon", tintColor: Color("#E2E3E4"))
        }
    }
    
    var resetIcon: some View{
        ZStack{
            TopBarIconView(imageName: "reset_icon", tintColor: Color("#E2E3E4"))
        }
    }
    
    var doneIcon: some View{
        ZStack{
            TopBarIconView(imageName: "done_icon", tintColor: Color("#E2E3E4"))
        }
    }
}

#Preview {
    TopBarView()
}
