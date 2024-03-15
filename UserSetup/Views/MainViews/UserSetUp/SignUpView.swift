//
//  SignUpView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel:SignUpViewModel
    @State private var isSecure:Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                VStack{
                    Text("Welcome to")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    Text("AI Image generator ")
                        .font(.title.bold())
                }
                .padding(.bottom,80)
                .padding(.top,50)
                TextField("Name", text: $viewModel.name)
                    .padding()
                    .frame(width: 350,height: 60)                                                                                                                                        
                    .background(Color(red: 32 / 255, green: 31 / 255, blue: 36 / 255))
                    .cornerRadius(8)
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .frame(width: 350,height: 60)
                    .background(Color(red: 32 / 255, green: 31 / 255, blue: 36 / 255))
                    .cornerRadius(8)
                ZStack{
                    if isSecure{
                        SecureField("password", text: $viewModel.password)
                            .padding()
                            .frame(width: 350, height: 60)
                            .background(Color(red: 32 / 255, green: 31 / 255, blue: 36 / 255))
                            .cornerRadius(8)
                        Image("Component 316 – 3")
                            .foregroundColor(.gray)
                            .padding(.leading,300)
                            .onTapGesture {
                                isSecure.toggle()
                            }
                                                            
                    } else{
                        TextField("password", text: $viewModel.password)
                            .padding()
                            .frame(width: 350, height: 60)
                            .background(Color(red: 32 / 255, green: 31 / 255, blue: 36 / 255))
                            .cornerRadius(8)
                        Image("Component 316 – 3")
                            .foregroundColor(.gray)
                            .padding(.leading,300)
                            .onTapGesture {
                                isSecure.toggle()
                            }
                    }
                    
                }
                HStack{
                    Image("Path 13")
                    Text("Must have uppercase")
                        .foregroundStyle(Color.green)
                    Spacer()
                    
                }
                .padding(.horizontal,30)
                
                Button(action: {
                    viewModel.Register()
                }){
                    Text("Get Started, It's free! ")
                        .font(.title3.bold())
                }.frame(width: 350, height: 60)
                    .background(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.top,40)
                Spacer()
                Button{
                    dismiss()
                }label: {
                    HStack{
                        Text("Already have an account?")
                            .foregroundStyle(Color.gray)
                        Text("Sign in")
                            .underline()
                            .foregroundStyle(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
//                        NavigationLink(destination: SignInView()){
//                            Text("Sign in")
//                                .underline()
//                                .foregroundStyle(Color.purple)
//                               
//                        }
                        
                    }
                    .padding()
                }
                
            }
            .ignoresSafeArea()
            
        }
        Spacer()
       
            .environment(\.colorScheme, .dark)
    }
}

//#Preview {
//    SignUpView()
//}
