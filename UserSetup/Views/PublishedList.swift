//
//  PublishedList.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 07/02/2024.
//

import SwiftUI
import Lottie
struct PublishedList: View {
    @StateObject var imageModel = ImageArtViewModel()
    @State private var onClickImage:Int?
  
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
            ForEach(imageModel.ImageArray2.indices, id: \.self){ index in
                let imageData = imageModel.ImageArray2[index]
                Image(imageData.imageName)
                    .resizable()
                    .frame(width: 180)
                    .overlay(
                        Group {
                            if onClickImage == index {
                                LottieView(animation: .named("Load2"))
                                    .playing()
                                    .looping()
                                    .resizable()
                                    .frame(width: 80, height: 80)
                            }
                            else{
                                HStack(){
                                    Text(imageData.text)
                                        .padding()
                                        .font(Font.custom(CustomFonts.OpenSansMedium, size: 11))
                                    Spacer()
                                    Image("Moreicon")
                                    
                                        .padding()
                                }
                                    .padding(.top,120)
                            }
                        }
                    )
            }
        }
    }
}

#Preview {
    PublishedList()
}