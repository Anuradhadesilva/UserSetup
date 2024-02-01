//
//  CustomFont.swift
//  UserSetup
//
//  Created by Anuradha Desilva on 01/02/2024.
//


import Foundation
import SwiftUI
import UIKit


struct CustomFonts {
    static let AktivGroteskLight = "AktivGroteskCorp-Light"
    static let AktivGroteskLightItalic = "AktivGroteskCorp-LightItalic"
    static let AktivGroteskItalic = "AktivGroteskCorp-Italic"
    static let AktivGroteskRegular = "AktivGroteskCorp-Regular"
    static let AktivGroteskMedium = "AktivGroteskCorp-Medium"
    static let AktivGroteskMediumItalic = "AktivGroteskCorp-MediumItalic"
    static let AktivGroteskBold = "AktivGroteskCorp-Bold"
    static let AktivGroteskBoldItalic = "AktivGroteskCorp-Bold"
    
    static let OpenSansRegular = "OpenSans-Regular"
    static let OpenSansLight = "OpenSans-Light"
    static let OpenSansMedium = "OpenSans-Medium"
    static let OpenSansSemiBold = "OpenSans-SemiBold"
    static let OpenSansBold = "OpenSans-Bold"
}

/* When You need to get relevant custom Font for swift ui releted view use relavant string and pass them appropraitely
 eg : Text("SwiftUI custom fonts")
          .font(Font.custom(CustomFonts.AktivGroteskItalic, size: 16))
          .foregroundColor(.white)
 */


/* When you need custom fonts for UIKit Based elements, then use this method font type pass as CutomFonts.AktivGroteskItalic like etc */
class Fonts {
    class func fontForType(fontType: String, fontSize: CGFloat) -> UIFont? {
        
        let fontName = fontType
        
        let font = UIFont.init(name: fontName, size: fontSize)
        
        return font
    }
}

