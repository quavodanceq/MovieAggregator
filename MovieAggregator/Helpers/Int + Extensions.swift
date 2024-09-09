//
//  Int + Extensions.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 02.09.2024.
//

import Foundation

extension Int {
    var asKFormat: String {
        if self >= 1000 {
            return "\(self / 1000)k"
        } else {
            return "\(self)"
        }
    }
}
