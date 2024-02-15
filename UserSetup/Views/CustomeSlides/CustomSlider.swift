//
//  CustomSlider.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 12/02/2024.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    private let minValue: Double = 0
    private let maxValue: Double = 100
    private let thumbRadius: CGFloat = 12
    
//    @State var lastCoordinateValue = 0.0
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.purple)
                    .frame(width: geometry.size.width, height: 8)
                ZStack{
                    let fraction = CGFloat(value/(maxValue - minValue))
                    
                    let width = geometry.size.width * fraction
                    
                    let offset = min((geometry.size.width / 2) + width, geometry.size.width / 2)
                    
                    Rectangle()
                        .fill(Color(UIColor(red: 106/255, green: 13/255, blue: 173/255, alpha: 1.0)))
                        .frame(width: abs(width), height: 8)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .offset(x: offset - geometry.size.width / 2)
                }
                Circle()
                    .fill(Color(UIColor(red: 106/255, green: 13/255, blue: 173/255, alpha: 1.0)))
//                    .fill(Color.white)
//                    .fill(Color.orange.opacity(0.5))
//                    .stroke(Color.orange, lineWidth: 3)
                    .frame(width: thumbRadius * 2)
                    .offset(x: CGFloat(value / (maxValue - minValue)) * geometry.size.width - thumbRadius)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ gesture in
                                UpdateValue(with: gesture, in: geometry)
                                
                            })
                        )
            }
        }
    }
    
    private  func UpdateValue(with gesture:DragGesture.Value, in geometry:GeometryProxy){
        let dragPotion = gesture.location.x / geometry.size.width
//        let newValue = Double((maxValue-minValue)*dragPotion) - maxValue
        let newValue = dragPotion * (maxValue - minValue) + minValue
        value = min(max(newValue,minValue),maxValue)
    }
}

//
//#Preview {
//    CustomSlider(value: )
//}
