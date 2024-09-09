//
//  Fonts.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 09.09.2024.
//

import Foundation
import UIKit

extension UIFont {
    func customFont(_ family: FontFamily, _ type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: "\(family)\(type)", size: size) ?? UIFont()
    }
}

enum FontFamily: String {
    
    case appleSDGothicNeo = "AppleSDGothicNeo"
    case copperplate = "Copperplate"
}

enum FontType: String {
    
    case bold = "-Bold"
    case regular = "-Regular"
    case semiBold = "-SemiBold"
}
