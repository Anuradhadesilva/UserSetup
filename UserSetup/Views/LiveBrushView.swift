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
                    .frame(width: .infinity, height: 600)
                    
                    
            }
            LiveBrushBottomBar()
        }
    }
}

#Preview {
    LiveBrushView()
}
