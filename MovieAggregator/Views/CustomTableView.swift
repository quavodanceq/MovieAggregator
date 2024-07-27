//
//  CustomTableView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 26.07.2024.
//

import Foundation
import UIKit

class CustomTableView: UITableView {
    
    let movieView = MovieView()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        addSubview(movieView)
        NSLayoutConstraint.activate([
            movieView.topAnchor.constraint(equalTo: topAnchor),
            movieView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieView.trailingAnchor.constraint(equalTo: trailingAnchor)
           
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
