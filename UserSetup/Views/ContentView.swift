//
//  ContentView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 16/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mainViewModel = MainViewModel()
    var body: some View {
        VStack{
            MainTopBarView(viewModel:mainViewModel)
                .fullScreenCover(isPresented: $mainViewModel.showProfileView,content: {
                    UserOption()
                })

        }
        
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView()
}
