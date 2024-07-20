//
//  UIColor + Extension.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.07.2024.
//

import Foundation
import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
    
    static let customGreem = UIColor.init(red: 59/255, green: 179/255, blue: 59/255, alpha: 1)
    static let customGray = UIColor.init(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
}
