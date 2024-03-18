//
//  ContentView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var profileViewModel:ProfileViewModel
    @ObservedObject var signInModel:SignInViewModel
    @ObservedObject var signUpModel:SignUpViewModel
    @ObservedObject var authViewModel:AuthenticateViewModel
    @ObservedObject  var mainViewModel:MainViewModel
    var body: some View {
        VStack{
            MainTopBarView(viewModel:mainViewModel)
                .fullScreenCover(isPresented: $mainViewModel.showProfileView,content: {
                    ProfileView(viewmodel: profileViewModel, signInModel: signInModel, signUpModel: signUpModel, mainViewModel: mainViewModel)
                })
                .fullScreenCover(isPresented: $mainViewModel.showOptionView,content: {
                    UserOption(signInModel: signInModel, signUpViewModel: signUpModel, viewModel: authViewModel)
                })

        }
        
        .environment(\.colorScheme, .dark)
    }
}
//
//#Preview {
//    ContentView()
//}

