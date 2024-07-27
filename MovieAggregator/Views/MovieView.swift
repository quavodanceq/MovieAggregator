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
    
    private let playButton = PlayButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ movie: Movie) {
        self.movie = movie
        backgroundColor = .black
        setupImageView()
        setupOverviewLabel()
        setupWatchButton()
        setupConstraints()
    }
    
    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        var baseURL = APIs.Image.baseURL
        guard let path = movie?.backdropPath else { return }
        baseURL.append(path: path)
        imageView.sd_setImage(with: baseURL)
    }
    
    func setupOverviewLabel() {
        overviewLabel.numberOfLines = 0
        overviewLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        overviewLabel.textColor = .white
        overviewLabel.textAlignment = .center
        self.overviewLabel.text = movie?.overview ?? ""
        addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupWatchButton() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
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
            
        ])
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 10),
            playButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor, multiplier: 0.25),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    
}
