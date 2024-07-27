//
//  MovieView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 26.07.2024.
//

import Foundation
import UIKit

class MovieView: UIView {
    
    private var movie: Movie?
    
    private let imageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let overviewLabel = UILabel()
    
    private let watchButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ movie: Movie) {
        backgroundColor = .black
        self.movie = movie
        setupImageView()
        setupOverviewLabel()
        setupConstraints()
        var baseURL = APIs.Image.baseURL
        baseURL.append(path: movie.backdropPath)
        imageView.sd_setImage(with: baseURL)
        self.overviewLabel.text = movie.overview
    }
    
    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupOverviewLabel() {
        overviewLabel.numberOfLines = 0
        overviewLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        overviewLabel.textColor = .white
        overviewLabel.textAlignment = .center
        addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupWatchButton() {
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.56),
        ])
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //overviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    
}
