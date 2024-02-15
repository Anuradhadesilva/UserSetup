//
//  TopBarIconView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 08/02/2024.
//

import SwiftUI

struct TopBarIconView: View {
    var imageName:String
    var tintColor:Color
    var body: some View {
        ZStack{
            Color.clear
            Image(imageName)
                .resizable()
                .foregroundColor(tintColor)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24,height: 24, alignment: .center)
        }
        .frame(width: 44,height: 44)
    }
}

#Preview {
    TopBarIconView(imageName: "back", tintColor: Color("#E2E3E4"))
}
