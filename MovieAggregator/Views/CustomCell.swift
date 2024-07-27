//
//  CustomCell.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 13.07.2024.
//

import Foundation
import UIKit
import SDWebImage


class CustomCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    
    private let votesLabel = Paddinglabel()
    
    private let imageView = UIImageView()
    
    private var movie: Movie?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ movie: Movie) {
        self.movie = movie
        setupImageView()
        setupVotesLabel()
        setupTitleLabel()
        setupConstraints()
    }

    
    private func setupTitleLabel() {
        
        addSubview(titleLabel)
        titleLabel.text = movie?.originalTitle
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 17)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupVotesLabel() {
        addSubview(votesLabel)
        if let vote = movie?.voteAverage {
            let voteFloat = Float(vote)
            if voteFloat < 7 {
                votesLabel.backgroundColor = .customGray
                
            } else {
                votesLabel.backgroundColor = .customGreem
            }
            votesLabel.text = String(format: "%.1f", vote)
        }
        votesLabel.layer.cornerCurve = .continuous
        votesLabel.layer.cornerRadius = 10
        votesLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        votesLabel.textColor = .white
        votesLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupImageView() {
        addSubview(imageView)
        var baseURL = APIs.Image.baseURL
        baseURL.append(path: movie?.posterPath ?? "")
        imageView.sd_setImage(with: baseURL)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
//            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            votesLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5),
            votesLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 5)
        ])
    }
    
}
