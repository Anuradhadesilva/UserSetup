//
//  CustomButtonView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 30/01/2024.
//

import SwiftUI


struct CustomBackButton: View {
    @State var imageIcon = "Back Button"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }){
            HStack{
                Image(imageIcon)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    CustomBackButton()
}
