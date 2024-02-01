//
//  ProfileView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 30/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewModel()
    @StateObject var imageModel = ImageArtViewModel()
    
    //    @State private var MyProjectSelect = true
    //    @State private var PublishedArtSelect = false
    @State private var selectedTab: Tab = .MyProjectSelect
    
    @State private var isiconselected = false
    enum Tab {
        case MyProjectSelect, PublishedArtSelect
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            if let user = viewmodel.user {
                ScrollView{
                    
                    VStack{
                        Image("Mask Group 13582")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                       
                        Text(user.name)
                            .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
                            .foregroundColor(.white)
                        Button("Sign Out"){
                            viewmodel.logOut()
                        }
                    }
                    .frame(width: 370, height: 200)
                    .background(Color(red: 20 / 255, green: 20 / 255, blue: 22 / 255))
                    .cornerRadius(8.0)
                    HStack{
                        VStack{
                            HStack{
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                                    .foregroundColor(selectedTab == .MyProjectSelect ? Color.purple : Color.white)
                                //                                .foregroundColor(MyProjectSelect ? Color.purple : Color.white)
                                
                                Text("My Projects")
                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 14))
                                    .foregroundColor(selectedTab == .MyProjectSelect ? Color.purple : Color.white)
                                
                            }
                            .onTapGesture{
                                selectedTab = .MyProjectSelect
                                //                            MyProjectSelect.toggle()
                                //                            PublishedArtSelect = false
                            }
                            
                            Rectangle()
                                .frame(width:108, height: 2)
                                .foregroundColor(selectedTab == .MyProjectSelect ? Color.purple : Color.clear)
                            
                        }
                        .padding(.trailing)
                        VStack{
                            HStack{
                                Image(systemName: "globe.americas.fill")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                                    .foregroundColor(selectedTab == .PublishedArtSelect ? Color.purple : Color.white)
                                //                                .foregroundColor(PublishedArtSelect ? Color.purple : Color.white)
                                Text("Published Arts")
                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 14))
                                    .foregroundColor(selectedTab == .PublishedArtSelect ? Color.purple : Color.white)
                                //                                .foregroundColor(PublishedArtSelect ? Color.purple : Color.white)
                                //                                .bold()
                            }
                            .onTapGesture(){
                                selectedTab = .PublishedArtSelect
                                //                            PublishedArtSelect.toggle()
                                //                            MyProjectSelect = false
                            }
                            Rectangle()
                                .frame(width:120, height: 2)
                                .foregroundColor(selectedTab == .PublishedArtSelect ? Color.purple : Color.clear)
                        }
                        Spacer()
                        
                    }
                    .padding()
                    
                    VStack
                    {
                        if selectedTab == .MyProjectSelect{
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                                ForEach(imageModel.ImageArray, id: \.self){ imageName in
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 180)
                                        .overlay(
                                            HStack(){
                                                Text("Image")
                                                    .padding()
                                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 11))
                                                Spacer()
                                                Image("Moreicon")
                                                
                                                    .padding()
                                            }
                                                .padding(.top,120)
                                        )
                                }
                            }
                            .padding(.horizontal,12)
                        } else if selectedTab == .PublishedArtSelect{
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                                ForEach(imageModel.ImageArray2, id: \.self){ imageName in
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 180)
                                        .overlay(
                                            HStack(){
                                                Text("Image")
                                                    .padding()
                                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 11))
                                                Spacer()
                                                Image("Moreicon")
                                                
                                                    .padding()
                                            }
                                                .padding(.top,120)
                                        )
                                }
                            }
                            .padding(.horizontal,12)
                        }
                    }
                    
                    .toolbar(){
                        ToolbarItem(placement: .topBarLeading){
                            CustomBackButton(imageIcon: "Group 14594")
                        }
                        ToolbarItem(placement: .principal){
                            Text("Profile")
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            Image("Settings_44")
                        }
                    }
                }
            } else{
                ScrollView
                {
                    VStack{
                        Spacer()
                        Image("Mask Group 13582")
                            .resizable()
                            .frame(width: 75,height: 75)
                        Spacer()
        
                        Button(action: {
                            print("Sign In")
                        }) {
                            HStack {
                                NavigationLink(
                                    destination: SignInView()){
                                        Text("Sign In")
                                            .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
                                            .foregroundColor(Color.white)
                                    }
                                
                            }
                        }
                        .frame(width: 215, height: 48)
                        .background(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
                        .cornerRadius(8)
                        Spacer()
//                        Text(user.name)
//                            .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
//                            .foregroundColor(.white)
//                        Button(action:{
//
//                        }){
//                            NavigationLink(
//                                destination: SignUpView()){
//                                    Image("Email icon")
//                                    Text("Sign up with email")
//                                        .font(.title3.bold())
//                                        .foregroundColor(Color.white)
//                                }
//                            Text("Sign In")
//                                .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
//                        }
//                        .frame(width: 215, height: 48)
//                        .background(Color(red: 166 / 255, green: 69 / 255, blue: 255 / 255))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
                        
                    }
                    .frame(width: 370, height: 200)
                    .background(Color(red: 20 / 255, green: 20 / 255, blue: 22 / 255))
                    .cornerRadius(8.0)
                    .padding(.top,-40)
                    VStack{
                        HStack{
                            VStack{
                                HStack{
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 13, height: 13)
                                        .foregroundColor(selectedTab == .MyProjectSelect ? Color.purple : Color.white)
                                    //                                .foregroundColor(MyProjectSelect ? Color.purple : Color.white)
                                    
                                    Text("My Projects")
                                        .font(Font.custom(CustomFonts.OpenSansMedium, size: 14))
                                        .foregroundColor(selectedTab == .MyProjectSelect ? Color.purple : Color.white)
                                    
                                }
                                .onTapGesture{
                                    selectedTab = .MyProjectSelect
                                    
                                }
                                
                                Rectangle()
                                    .frame(width:108, height: 2)
                                    .foregroundColor(selectedTab == .MyProjectSelect ? Color.purple : Color.clear)
                                
                            }
                            .padding(.trailing)
                            VStack{
                                HStack{
                                    Image(systemName: "globe.americas.fill")
                                        .resizable()
                                        .frame(width: 13, height: 13)
                                        .foregroundColor(selectedTab == .PublishedArtSelect ? Color.purple : Color.white)
                                  
                                    Text("Published Arts")
                                        .font(Font.custom(CustomFonts.OpenSansMedium, size: 14))
                                        .foregroundColor(selectedTab == .PublishedArtSelect ? Color.purple : Color.white)
                                 
                                }
                                .onTapGesture(){
                                    selectedTab = .PublishedArtSelect
                              
                                }
                                Rectangle()
                                    .frame(width:120, height: 2)
                                    .foregroundColor(selectedTab == .PublishedArtSelect ? Color.purple : Color.clear)
                            }
                            Spacer()
                            
                        }
                    }
                    .padding()
                   
                   
                    VStack{
                        if selectedTab == .MyProjectSelect{
                            VStack{
                                Spacer()
                                Image("publish")
                                Text("No Projects yet*")
                                    .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
                                    .padding(5)
                                Text("Your projects / Artworks will be saved here**")
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 12))
                                Spacer()
                                Spacer()
                            }
                            
                            .frame(width:400,height:450)
                        } else if selectedTab == .PublishedArtSelect{
                            VStack{
                                Spacer()
                                Image("publish")
                                Text("No Published Arts yets")
                                    .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
                                    .padding(5)
                                Text("Your published projects / Artworks will be saved here**")
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 12))
                                Spacer()
                                Spacer()
                            }
                            
                            .frame(width:400,height:450)
                        }
                    }
                   
                       
                    
                    
                    
//                    VStack
//                    {
//                        if selectedTab == .MyProjectSelect{
//                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
//                                ForEach(imageModel.ImageArray, id: \.self){ imageName in
//                                    Image(imageName)
//                                        .resizable()
//                                        .frame(width: 180)
//                                        .overlay(
//                                            HStack(){
//                                                Text("Image")
//                                                    .padding()
//                                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 11))
//                                                Spacer()
//                                                Image("Moreicon")
//
//                                                    .padding()
//                                            }
//                                                .padding(.top,120)
//                                        )
//                                }
//                            }
//                            .padding(.horizontal,12)
//                        } else if selectedTab == .PublishedArtSelect{
//                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
//                                ForEach(imageModel.ImageArray2, id: \.self){ imageName in
//                                    Image(imageName)
//                                        .resizable()
//                                        .frame(width: 180)
//                                        .overlay(
//                                            HStack(){
//                                                Text("Image")
//                                                    .padding()
//                                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 11))
//                                                Spacer()
//                                                Image("Moreicon")
//
//                                                    .padding()
//                                            }
//                                                .padding(.top,120)
//                                        )
//                                }
//                            }
//                            .padding(.horizontal,12)
//                        }
//                    }
                    
                    .toolbar(){
                        ToolbarItem(placement: .topBarLeading){
                            CustomBackButton(imageIcon: "Group 14594")
                        }
                        ToolbarItem(placement: .principal){
                            Text("Profile")
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            Image("Settings_44")
                        }
                    }
                }
            }
        }
        .onAppear{
            viewmodel.fetchUser()
        }
        .environment(\.colorScheme, .dark)
    }
}



#Preview {
    ProfileView()
}



