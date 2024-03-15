//
//  ProfileView.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 30/01/2024.
//

import SwiftUI
import Lottie
import SDWebImageSwiftUI
import UIKit


struct ProfileView: View {
    @ObservedObject var viewmodel:ProfileViewModel
    @ObservedObject var signInModel:SignInViewModel
    @ObservedObject var signUpModel:SignUpViewModel
//    @ObservedObject var AuthViewModel:AuthenticateViewModel
//    @StateObject var imageModel = ImageArtViewModel()
    
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
//                        WebImage(url: <#T##URL?#>)
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
                    .padding(.top,-40)
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
                            ProjectListView(imageModel: ImageArtViewModel())
                            .padding(.horizontal,12)
                        } else if selectedTab == .PublishedArtSelect{
                           PublishedList(imageModel: ImageArtViewModel())
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
                                    destination: SignInView(viewModel: signInModel, signUpViewModel: signUpModel)){
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



//#Preview {
//    ProfileView()
//}



