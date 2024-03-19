//
//  UsersetUp.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 16/02/2024.
//

import SwiftUI
import AuthenticationServices
struct UserOption: View {
    @ObservedObject var signInModel:SignInViewModel
    @ObservedObject var signUpViewModel:SignUpViewModel
    @ObservedObject var viewModel:AuthenticateViewModel
    @Environment(\.dismiss) var dismiss
    private func signInWithGoogle() {
       Task {
         if await viewModel.signInWithGoogle() == true {
           dismiss()
         }
       }
     }
    var body: some View {
        NavigationStack{
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
                    .padding(.bottom,30)
                    HStack{
                        Text("Already have an account?")
                        NavigationLink(destination: SignInView(viewModel: signInModel, signUpViewModel: signUpViewModel)){
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
                    .padding(.bottom,14)
                    .padding()
                    VStack(spacing: 20) {
                        Button(action: {
                            viewModel.appleSignIn()
                            viewModel.isConnectingApple = true
                        }) {
                          HStack{
                            Image("Apple icon")
//                                  .padding(.leading,8)
//                              .resizable()
//                              .scaledToFill()
//                              .frame(width: 18, height: 24, alignment: .center)
                              Text(viewModel.isConnectingApple ? "Connecting..." : "Sign In With Apple")
                                  .foregroundColor(Color.black)
                                  .font(Font.custom(CustomFonts.OpenSansBold, size: 18))
                          }
                          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 65, maxHeight: 65)
                          .background(Color.white)
                          .cornerRadius(8)
                          .padding(.horizontal,20)
                        }
                        Button{
                            signInWithGoogle()
                            viewModel.isConnectingGoogle = true
                        }label:{
                            ZStack{
                                Rectangle()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 65, maxHeight: 65)
                                    .foregroundStyle(Color.red)
                                    .cornerRadius(8)
                                    .padding(.horizontal,20)
                                HStack(){
                                    Image("Google icon")
                                        .padding(.leading,8)
                                    Text(viewModel.isConnectingGoogle ? "Connecting..." : "Sign In With Google")
                                        .foregroundColor(Color.white)
                                        .font(Font.custom(CustomFonts.OpenSansBold, size: 18))
                                }
                                
                            }
                        }
                        
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
                        
                        NavigationLink(destination: SignUpView(viewModel: signUpViewModel)){
                            ZStack {
                                Rectangle()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 65, maxHeight: 65)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                                    .padding(.horizontal,20)
                                HStack {
                                    Image("Email icon")
                                    Text("Sign up with email")
                                        .font(Font.custom(CustomFonts.OpenSansBold, size: 18))
                                        .foregroundColor(Color.white)
                                }
                                
                            }
                        }
                   
                        VStack{
                            Text("By signing up you agree to our Terms of use & privacy_policy.")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .frame(width: 300, height: 40)
                        }
                        
                    }
                    
                    
                }
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
            }
            .navigationBarItems(leading: CustomBackButton(imageIcon: "Back Button"))

        }
        .environment(\.colorScheme, .dark)

    }
}
//
//#Preview {
//    UserOption()
//}
//
