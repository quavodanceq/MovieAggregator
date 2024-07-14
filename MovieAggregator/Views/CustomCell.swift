//
//  CustomCell.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 13.07.2024.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ text: String) {
        layer.borderColor = UIColor.black.cgColor
        setupLabel()
        setupConstraints()
        label.text = text
        label.backgroundColor = .random()
    }

    
    private func setupLabel() {
        
        addSubview(label)
        label.font = UIFont(name: "GillSans-SemiBold", size: 19)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.backgroundColor = .white
    }
    
    private func setupConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
