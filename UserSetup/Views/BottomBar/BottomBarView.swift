//
//  BottomBarView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 12/02/2024.
//

import SwiftUI

struct BottomBarView: View {
    let tabImage: [String] = ["circle.fill", "mic.fill", "paintbrush.fill", "gear"]
    let tabLabel: [String] = ["exact","precise","density","solidity"]
    @State private var selectedIndex = 0
    let onSelectionChanged: (Int) -> Void
    
    var body: some View {
        ZStack{
            HStack{
                ForEach(tabImage.indices, id: \.self){index in
                    BottomBarIconView(image: tabImage[index], lable: tabLabel[index], isSelected: index == selectedIndex){
                        print("Tapped tab \(index + 1)")
                        self.selectedIndex = index
                        self.onSelectionChanged(index)
                    }
                }
            }
            
        }
        
    }
}

//#Preview {
//    BottomBarView(onSelectionChanged: <#(Int) -> Void#>)
//}
