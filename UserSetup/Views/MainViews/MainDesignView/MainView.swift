//
//  MainView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 16/02/2024.
//
//
//import SwiftUI
//
//struct MainView: View {
//    @StateObject private var mainViewModel = MainViewModel()
//    var body: some View {
//        VStack{
//            MainTopBarView(viewModel:mainViewModel)
//                .fullScreenCover(isPresented: $mainViewModel.showProfileView,content: {
//                    UserOption()
//                })
//
//        }
//        
//        .environment(\.colorScheme, .dark)
//    }
//}
//
//#Preview {
//    MainView()
//}
