//
//  UILabel + Extensions.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 27.07.2024.
//

import Foundation
import UIKit

extension UILabel {
    func setDynamicFont(baseSize: CGFloat, fontName: String) {
        let bounds = UIScreen.main.bounds
        let scaleFactor = min(bounds.width / 375, bounds.height / 812)
        let scaledSize = baseSize * scaleFactor
        self.font = UIFont(name: fontName, size: scaledSize)
    }
}
