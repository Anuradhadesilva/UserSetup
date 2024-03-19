//
//  ProjectPublishedListView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 07/02/2024.
//

import SwiftUI
import Lottie
struct ProjectListView: View {
    @StateObject var imageModel = ImageArtViewModel()
    @State private var onClickImage:Int?
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
            ForEach(imageModel.ImageArray.indices, id: \.self){ index in
                let imageData = imageModel.ImageArray[index]
                Image(imageData.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .clipped()
                    .onTapGesture {
                        onClickImage = index
                    }
                    .overlay(
                        Group {
                            if index == 5 {
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
    ProjectListView()
}
