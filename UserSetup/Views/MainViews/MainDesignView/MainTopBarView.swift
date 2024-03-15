//
//  MainTopBarView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 16/02/2024.
//

import SwiftUI

struct MainTopBarView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    HStack{
                        Text("Design")
                            .font(Font.custom(CustomFonts.OpenSansBold, size: 20))
                    }
                    Spacer()
                    HStack{
                        Image("Settings_44")
                            .onTapGesture {
                                viewModel.showOptionView.toggle()
                            }
                            
                        Image("default_profile")
                            .onTapGesture {
                                viewModel.showProfileView.toggle()
                            }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
            }
            
            Spacer()
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    MainTopBarView(viewModel: MainViewModel())
}
