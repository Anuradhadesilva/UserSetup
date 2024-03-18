//
//  SignInView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel:SignInViewModel
    @ObservedObject var signUpViewModel:SignUpViewModel
    @State private var isSecure:Bool = true
    @Environment(\.dismiss) var dismiss
//    @State private var showAlert:Bool = false
    @State private var email:String = ""
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Sign in with email")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .padding()
                HStack{
//                if !viewModel.errorMessage.isEmpty{
//                    Alert(title: Text(viewModel.errorMessage))
////                    Text(viewModel.errorMessage)
////                        .foregroundStyle(.red)
////                        .padding(.leading,25)
////                        Spacer()
//                }
                }
                TextField("Email Address", text: $viewModel.email)
                    .padding()
                    .frame(width: 350, height: 60)
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
//                        Button(
//                            action: {
//                                isSecure.toggle()
//                            }){
//                                Image("Component 316 – 3")
//                                    .foregroundColor(.gray)
//                                    .padding(.leading,250)
//                            }
                    } else {
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
//                        Button(
//                            action: {
//                                isSecure.toggle()
//                            }){
//                                Image("Component 316 – 3")
//                                    .foregroundColor(.gray)
//                                    .padding(.leading,250)
//                            }
                        
                    }
                    
                }
                HStack(){
                    NavigationLink(destination: ForgetPasswordView(emailAddress:email )){
                        Text("Forget password")
                            .foregroundStyle(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                            .padding(.horizontal,35)
                            .padding(.top,5)
                            .underline()
                            Spacer()
                            .toolbar{
                                
                                ToolbarItem(placement: .topBarTrailing){
                                    Button{
                                        
                                    } label: {
                                        Image("Settings_44")
                                    }
                                }
                            }
                    }
                }
                Button(action:{
                    viewModel.login()
                    if viewModel.errorMessage.isEmpty{
                        viewModel.showAlert = false
//                        dismiss()
                    }
                    else{
                        viewModel.showAlert = true
                    }
                }){
                    Text("Log In")
                        .font(.title3.bold())
                        
                }
//                .disabled(!viewModel.errorMessage.isEmpty)
                .frame(width: 350, height: 60)
                .background(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                .alert(isPresented: $viewModel.showAlert) {
                    if viewModel.invalidLogin {
                        Alert(title: Text("Invalid email address or password"),
                              dismissButton: .default(Text("OK")))
                    } else {
                        Alert(title: Text("Error"), message: Text(viewModel.errorMessage),
                              dismissButton: .default(Text("OK")))
                    }
                }
                Spacer()
                Button{
                    dismiss()
                }
            label:{
                HStack{
                    Text("Don't have an account?")
                        .foregroundStyle(Color.gray)
                  
                    NavigationLink(destination: SignUpView(viewModel: signUpViewModel)){
                        Text("Sign up")
                            .foregroundStyle(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                            .underline()
                        
                    }
                    
                    
                }
                .padding()
            }
            }
            
        }
        .environment(\.colorScheme, .dark)
    }
}

//#Preview {
//    SignInView()
//}
