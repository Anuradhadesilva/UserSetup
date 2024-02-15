//
//  ExactCustomSlider.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 15/02/2024.
//

import SwiftUI

struct ExactCustomSlider: View {
    
    @Binding var value: Double

    @State var minValue: Double = 0
    @State var maxValue: Double = 100
    @State var thumbRadius: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading, content: {
                //--Track
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.purple)
                    .frame(width: geometry.size.width, height: 4)
                
                //--Tinted track
                ZStack{
                    let fraction = CGFloat(value/(maxValue - minValue))
                    
                    let width = geometry.size.width * fraction
                    
                    let offset = min((geometry.size.width / 2) + width, geometry.size.width / 2)
                    
                    Rectangle()
                        .fill(Color(UIColor.lightGray))
                        .frame(width: abs(width), height: 4)
                        .offset(x: offset - geometry.size.width / 2)
                }
                
                //--Thumb
                ZStack{
                    Circle()
                        .fill(Color.purple)
                        .frame(width: thumbRadius * 2, height: thumbRadius * 2)
                }
                .offset(x: CGFloat(value / (maxValue - minValue)) * geometry.size.width - thumbRadius)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ gesture in
                            updateValue(with: gesture, in: geometry)
                        })
                )
            }).padding(.top, (geometry.size.height - thumbRadius * 2) / 2)
        }
    }
    
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        let newValueDouble = newValue*(maxValue - minValue) + minValue
        
        value = min(max(newValueDouble,minValue),maxValue)
    }
}

#Preview {
    ExactCustomSlider(value: Binding.constant(0))
}

