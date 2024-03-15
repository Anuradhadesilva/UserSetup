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
            VStack{
//                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
//                    ProfileView()
//                }
//                else{
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
//                                SignInWithAppleButton(.signIn) { request in
//                                       viewModel.handleSignInWithAppleRequest(request)
//                                     } onCompletion: { result in
//                                       viewModel.handleSignInWithAppleCompletion(result)
//                                     }
//                                     .signInWithAppleButtonStyle(.white)
//                                     .frame(width: 350, height: 65)
//                                     .cornerRadius(8)
//                                Button(action: {
//                                    print("Sign in with Apple")
//                                }) {
//                                    HStack{
//                                        Image("Apple icon")
//                                        Text("Sign in with Apple")
//                                            .foregroundColor(Color.black)
//                                            .font(.title3.bold())
//
//                                    }
//                                }
//                                .frame(width: 350, height: 65)
//                                .background(Color.white)
//                                .cornerRadius(8)

                                Button(action:signInWithGoogle) {
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
                                            destination: SignUpView(viewModel: signUpViewModel)){
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
//                }

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
