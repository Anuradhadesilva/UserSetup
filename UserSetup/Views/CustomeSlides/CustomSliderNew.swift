//
//  CustomSliderNew.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 12/02/2024.
//

import SwiftUI

struct CustomSliderNew: View {
    @Binding var value: Double
    @State var width1:CGFloat = 0
    var totalWidth = UIScreen.main.bounds.width - 120
    var body: some View {
        
        ZStack(alignment: .leading){
            Rectangle()
                .fill(Color.purple)
                .frame(width: totalWidth,height: 8)
                .scaledToFit()
            
            Rectangle()
                .fill(Color(UIColor(red: 106/255, green: 13/255, blue: 173/255, alpha: 1.0)))
                .frame(width: width1,height: 8)
            Circle()
                .fill(Color(UIColor(red: 106/255, green: 13/255, blue: 173/255, alpha: 1.0)))
                .frame(width: 18,height: 18)
                .offset(x: self.width1)
                .gesture(
                    DragGesture()
                        .onChanged({(value) in
                            let newX = min(max(value.location.x, 0), totalWidth)
                            let percentage = (newX / totalWidth) * 100
                            self.width1 = newX
                            self.value = Double(percentage)
                            //                                if value.location.x <= totalWidth  && value.location.x >= 0{
                            //                                    self.width1 = value.location.x
                            //                                }
                        }
                                  )
                )
        }.padding()
        
    }
}

//#Preview {
//    CustomSliderNew()
//}
