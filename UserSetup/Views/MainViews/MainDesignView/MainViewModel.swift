//
//  MainViewModel.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 16/02/2024.
//

import SwiftUI
import Foundation

class MainViewModel:ObservableObject{
    @Published var showProfileView:Bool = false
    @Published var showOptionView:Bool = false
}
