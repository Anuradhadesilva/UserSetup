//
//  LiveBrushBottomBar.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 13/02/2024.
//

import SwiftUI

struct LiveBrushBottomBar: View {
    let tabBrush:[String] = ["brush","brush","brush","brush","brush","brush","brush","brush","brush","brush"]
    let tabTBrush:[String] = ["preview_1","preview_2","preview_3","preview_4","preview_5","preview_6","preview_7","preview_8","preview_9","preview_10"]
    let brushLabel:[String] = ["brush1","brush2","brush3","brush4","brush5","brush6","brush7","brush8","brush9","brush1"]
    @State private var selectedIndex = 12
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Rectangle()
                    .frame(height: 98)
                    .frame(width: .infinity)
                    .offset(y: -28)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment:.bottom){
                        Spacer()
                        ForEach(0..<tabBrush.count, id: \.self){index in
                            LiveBrushBottomBarIcon(imageName: tabBrush[index], imageTName: tabTBrush[index], labelName: brushLabel[index], isSelected: index == selectedIndex)
                                .onTapGesture{
                                    print("Tapped tab \(index )")
                                    self.selectedIndex = index
                                }
                            
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .padding(0)
            .background(Color(UIColor(red: 20/255, green: 20/255, blue: 22/255, alpha: 1.0)))
            
        }
    }
}

#Preview {
    LiveBrushBottomBar()
}
