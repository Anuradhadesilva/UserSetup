//
//  LiveBrushFilterBar.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 15/02/2024.
//

import SwiftUI

//enum LiveBrushFilterIcon:String{
//    case minValue = "min_size"
//    case maxValue = "max_size"
//    case spacing = "spacing"
//    case tilt = "tilt"
//    case algle = "angle"
//}

struct LiveBrushFilterView: View {
    @State private var sliderValue: Double = 0
    let imageArray:[String] = ["min_size","max_size","spacing","tilt","angle"]
//    private var subIconsArray = [LiveBrushFilterIcon]()
    @State private var selectedSubIconIndex = Int(0)
  
    
//    mutating func configureSubIconArray(){
//        subIconsArray = [.minValue,.maxValue,.spacing,.tilt,.algle]
//    }
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button{
                   
                }
            label:{
                Text("Cancel")
                    .foregroundStyle(.pink)
            }
                Spacer()
                Button{
                  
                }
            label:{
                Text("Done")
                    .foregroundStyle(Color.pink)
            }
            }
            .padding(.top,20)
            .padding(.leading)
            .padding(.trailing)
            Spacer()
            HStack{
                
                HStack{
                    Group{
                        Text(String(Int(sliderValue)) + "%")
                            .frame(width: 50)
                            .padding(.leading,5)
                        
                    }
                    .font(.custom(CustomFonts.AktivGroteskRegular, size: 15))
                    .foregroundStyle(Color.white)
                }
                Spacer()
                ExactCustomSlider(value: $sliderValue)
                    .frame(width: 300,height: 30)
                    
                    .onAppear {
                        //                            setAdjustmentSliderValue(index: selectedSubIconIndex)
                    }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .padding(.top, 8)

            HStack{
                Spacer()
                ForEach(0..<imageArray.count, id: \.self){ index in
                    Spacer()
                    VStack{
                        Image(imageArray[index]+"_icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(selectedSubIconIndex == index ? Color.white: Color.pink)
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text(imageArray[index])
                            .font(Font.custom(CustomFonts.OpenSansRegular, size: 11))
                            .foregroundColor(selectedSubIconIndex == index ? Color.white: Color.pink)
                    }
                    .frame(width: 65)
                    .onTapGesture{
                        selectedSubIconIndex = index
                    }
                   Spacer()
                }
                Spacer()
            }
            .frame(width: .infinity)
            Spacer()
            .ignoresSafeArea(.all)
        }
        .frame(width: .infinity ,height: 200)
        .background(Color.black)
    }
}
#Preview {
    LiveBrushFilterView()
}
