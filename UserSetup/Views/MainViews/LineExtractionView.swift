//
//  LineExtractionView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 08/02/2024.
//

import SwiftUI

struct LineExtractionView: View {
    @State  var currentValue:Double = 0
    let sliderValue:[Double] = [0,25,50,100]
//    var slide1 = Double ( (UIScreen.main.bounds.width - 120) * 0/4 )
//    var slide2 = Double ( (UIScreen.main.bounds.width - 120) * 1/4 )
//    var slide3 = Double ( (UIScreen.main.bounds.width - 120) * 2/4 )
//    var slide4 = Double ( (UIScreen.main.bounds.width - 120) )
//    
//    var sliderValue: [Double] {
//        [slide1, slide2, slide3, slide4]
//    }
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                TopBarView()
            }
            Spacer()
            
            VStack{
                Image("BackG")
                    .resizable()
                    
                    .aspectRatio(150/200,contentMode: .fit)
                  
            }
            VStack{
                HStack{
                    Spacer()
                    
                    Text("\(Int(currentValue))")
                        .frame(width: 50,height: 40)
                        .background(Color.purple)
                        .cornerRadius(5)
                        
                    
                    Spacer()
                    CustomSlider(value: $currentValue)
                        .frame(width: 270,height: 30)
                        .padding(.trailing,20)
                        .padding(.leading,20)
                    Spacer()
                }
                .frame(width: 380,height: 50)
                .background(Color.gray)
                .cornerRadius(5)
                
            }
            
            BottomBarView(onSelectionChanged:{ index in
                currentValue = sliderValue[index]
            })
            
           
        }
        
    }
}

#Preview {
    LineExtractionView()
}
