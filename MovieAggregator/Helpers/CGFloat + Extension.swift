//
//  CGFloat + Extension.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.07.2024.
//

import Foundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
