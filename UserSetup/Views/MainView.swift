//
//  ContentView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = AuthenticateViewModel()
    var body: some View {
        NavigationStack{
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
               ProfileView()
            }
            else{
                ZStack{
                    VStack {
                        VStack{
                            Image("Mask Group 13582")
                                .resizable()
                                .frame(width:60 ,height: 60)
                        }
                        .padding(.bottom,40)
                        VStack{
                            Text("FREE Account.")
                                .font(.title.bold())
                            Text("Anytime,Anywhere.")
                                .font(.title.bold())
                        }
                        .padding(.bottom,40)
                        HStack{
                            Text("Already have an account?")
                            NavigationLink(destination: SignInView()){
                                Text("Sign In")
                                    .underline()
                                
                            }
                            .toolbar{
                                ToolbarItem(placement: .topBarTrailing){
                                    Button{
                                        
                                    } label: {
                                        Image("Settings_44")
                                    }
                                    
                                }
                            }
                        }
                        .padding()
                        VStack(spacing: 20) {
                            Button(action: {
                                print("Sign in with Apple")
                            }) {
                                HStack{
                                    Image("Apple icon")
                                    Text("Sign in with Apple")
                                        .foregroundColor(Color.black)
                                        .font(.title3.bold())
                                    
                                }
                            }
                            .frame(width: 350, height: 65)
                            .background(Color.white)
                            .cornerRadius(8)
                            
                            Button(action: {
                                print("Sign in with Google")
                            }) {
                                HStack(){
                                    Image("Google icon")
                                        .padding(.leading,8)
                                    Text("Sign in with Google")
                                        .foregroundColor(Color.white)
                                        .font(.title3.bold())
                                }
                                
                            }
                            .frame(width: 350, height: 65)
                            .background(Color.red)
                            .cornerRadius(8)
                            
                            HStack {
                                Rectangle()
                                    .frame(width: 140, height: 1)
                                    .foregroundColor(.gray)
                                
                                Text("Or")
                                    .foregroundColor(.white)
                                    .padding()
                                Rectangle()
                                    .frame(width: 140, height: 1)
                                    .foregroundColor(.gray)
                                
                            }
                            .padding(.horizontal)
                            
                            Button(action: {
                                print("Sign up with email")
                            }) {
                                HStack {
                                    NavigationLink(
                                        destination: SignUpView()){
                                            Image("Email icon")
                                            Text("Sign up with email")
                                                .font(.title3.bold())
                                                .foregroundColor(Color.white)
                                        }
                                    
                                }
                            }
                            .frame(width: 350, height: 65)
                            .background(Color.blue)
                            .cornerRadius(8)
                            
                            Text("By signing up you agree to our Terms of use & privacy_policy.")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .frame(width: 300, height: 40)
                            
                        }
                        
                        
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .environment(\.colorScheme, .dark)
        
    }
}

#Preview {
    MainView()
}
