//
//  Fonts.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 09.09.2024.
//

import Foundation
import UIKit

extension UIFont {
    static func customFont(_ family: FontFamily, _ type: FontType, size: CGFloat) -> UIFont {
        let font = UIFont(name: "\(family.rawValue)\(type.rawValue)", size: size)!
        return font
    }
}

enum FontFamily: String {
    
    case appleSDGothicNeo = "AppleSDGothicNeo"
    case copperplate = "Copperplate"
    case georgia = "Georgia"
    case cochin = "Cochin"
}

enum FontType: String {
    
    case bold = "-Bold"
    case regular = "-Regular"
    case semiBold = "-SemiBold"
    case boldItalic = "-BoldItalic"
    case italic = "-Italic"
    
}
