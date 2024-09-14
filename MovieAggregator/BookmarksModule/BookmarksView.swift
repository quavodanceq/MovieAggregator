//  
//  BookmarksView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation
import UIKit

protocol BookmarksViewOutput: AnyObject {
    
}

protocol BookmarksViewInput {
    
    var output: BookmarksViewOutput? { get set }
    
}

class BookmarksView: UIView, BookmarksViewInput {
    
    weak var output: BookmarksViewOutput?
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
