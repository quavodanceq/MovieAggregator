//
//  PlayButton.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 27.07.2024.
//

import Foundation
import UIKit

class PlayButton: UIButton {
    
    private let imageV = UIImageView()
    
    private let label = UILabel()
    
    private lazy var stack = UIStackView(arrangedSubviews: [
        imageV,
        label
    ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradient()
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    private func setup() {
        setupLabel()
        setupConstraints()
    }
    
    private func setupLabel() {
        label.text = "Play"
        label.textColor = .white
        label.setDynamicFont(baseSize: 20, fontName: "AppleSDGothicNeo-Bold")
        
        imageV.image = UIImage(systemName: "play.fill")
        imageV.tintColor = .white
        imageV.contentMode = .scaleAspectFill
        
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.alignment = .center
        addSubview(stack)
    }
    
    private func setupConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        imageV.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageV.heightAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 1),
        ])
    }
    
    private func applyGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [
                UIColor.blue.cgColor,
                UIColor.systemBlue.cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0) 
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
            if let sublayers = self.layer.sublayers {
                for layer in sublayers {
                    if layer is CAGradientLayer {
                        layer.removeFromSuperlayer()
                    }
                }
            }
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    
}
