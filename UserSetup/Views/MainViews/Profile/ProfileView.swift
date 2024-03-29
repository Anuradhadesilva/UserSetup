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
    @ObservedObject var viewmodel = ProfileViewModel()
    @ObservedObject var signInModel:SignInViewModel
    @ObservedObject var signUpModel:SignUpViewModel
    @ObservedObject var mainViewModel:MainViewModel
    @ObservedObject var authViewModel:AuthenticateViewModel
    @State private var onTapProfileImage = false
    @State private var onTapEdit = false
//    @ObservedObject var AuthViewModel:AuthenticateViewModel
//    @StateObject var imageModel = ImageArtViewModel()
    
    //    @State private var MyProjectSelect = true
    //    @State private var PublishedArtSelect = false
    @State private var selectedTab: Tab = .MyProjectSelect
    @State var image:UIImage?
    @State private var isiconselected = false
    enum Tab {
        case MyProjectSelect, PublishedArtSelect
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            if let user = viewmodel.user {
                ScrollView(showsIndicators: false){
                    VStack{
                        HStack{
                            Button{
                                viewmodel.logOut()
                                mainViewModel.showProfileView.toggle()
                            }label:{
                                Image("Share icon 1")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.top)
                                
                            }
                            Spacer()
                            Button{
                                onTapEdit.toggle()
                            }label: {
                                Image("draw_icon")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.top)
                            }
                        }
                        .padding(.horizontal)
                        if onTapEdit {
                            if let profileImageURL = user.profileImageURL{
                                WebImage(url: profileImageURL)
                                //                        Image("Mask Group 13582")
                                    .resizable()
                                    .frame(width: 75,height: 75)
                                    .cornerRadius(100)
                                    .onTapGesture {
                                        onTapProfileImage = true
                                    }
                                    .overlay(
                                        VStack{
                                            Image("imagePicker_camera")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                        }
                                    )
                                    
                            } else {
                                Image("Mask Group 13582")
                                    .resizable()
                                    .frame(width: 75,height: 75)
                                    .overlay(
                                        VStack{
                                            Image("imagePicker_camera")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                        }
                                    )
                            }
                        } else {
                            if let profileImageURL = user.profileImageURL{
                                WebImage(url: profileImageURL)
                                //                        Image("Mask Group 13582")
                                    .resizable()
                                    .frame(width: 75,height: 75)
                                    .cornerRadius(100)
                            } else {
                                Image("Mask Group 13582")
                                    .resizable()
                                    .frame(width: 75,height: 75)
                            }
                        }
                        Text(user.name)
                            .font(Font.custom(CustomFonts.OpenSansBold, size: 17))
                            .foregroundColor(.white)
                        HStack{
                            Button{
                                onTapEdit.toggle()
                            }label:{
                                Text("Cancel")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                                    .foregroundStyle(.white)
                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 14))
                                    .background(.gray)
                                    .cornerRadius(8)
                            }
                            Spacer()
                            Button{
                                viewmodel.profileLoadController(image: image)
                                onTapEdit.toggle()
                            }label:{
                                Text("Save")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                                    .foregroundStyle(.white)
                                    .font(Font.custom(CustomFonts.OpenSansMedium, size: 14))
                                    .background(.blue)
                                    .cornerRadius(8)
                            }
                            
                        }
                        .padding(.horizontal)
                        .opacity(onTapEdit ? 1.0 : 0)
                    }
                    .fullScreenCover(isPresented: $onTapProfileImage, onDismiss: nil){
                        ImagePicker(image: $image)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                    .background(Color(red: 20 / 255, green: 20 / 255, blue: 22 / 255))
                    .cornerRadius(8.0)
                    .padding(.horizontal,20)
//                    .padding(.top,-40)
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
                                    destination: UserOption(signInModel: signInModel, signUpViewModel: signUpModel, viewModel: authViewModel)){
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
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                    .background(Color(red: 20 / 255, green: 20 / 255, blue: 22 / 255))
                    .cornerRadius(8.0)
                    .padding(.horizontal,20)
//                    .padding(.top,-40)
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
//                            .navigationBarBackButtonHidden()
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



