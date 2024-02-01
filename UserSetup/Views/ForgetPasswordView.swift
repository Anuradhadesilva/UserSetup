//
//  FogetPasswordView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 23/01/2024.
//

import SwiftUI

struct ForgetPasswordView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Forget Password")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .padding(.bottom,10)
                Text("Would you like to send a link to d********** gmail.com to verify you account?")
                    .multilineTextAlignment(.center)
                Button(action:{
                    print("Save")
                }){
                    Text("Send")
                        .font(.title3.bold())
                }
                .frame(width: 350,height: 60)
                .background(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                Spacer()
                HStack{
                    Text("Don't recieve code?")
                    NavigationLink( destination: ForgetPasswordView()){
                        Text("Resend")
                            .underline()
                            .foregroundStyle(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ForgetPasswordView()
}
