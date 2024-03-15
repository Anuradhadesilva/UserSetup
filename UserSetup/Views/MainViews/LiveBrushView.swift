//
//  LiveBrushView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 13/02/2024.
//

import SwiftUI

struct LiveBrushView: View {
    var body: some View {
        VStack{
            TopBarView()
            VStack{
                Image("BackG")
                    .resizable()
                    .frame(width: .infinity, height: 500)
                    
                Button{
                    print("true")
                }label:{
                    ZStack{
                        Rectangle()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 350, height: 60)
                        Text("text")
                            .foregroundStyle(.white)
                    }
                }
            }
            LiveBrushBottomBar()
        }
    }
}

#Preview {
    LiveBrushView()
}
