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
}
