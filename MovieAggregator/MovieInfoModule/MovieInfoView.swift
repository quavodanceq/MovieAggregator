//  
//  MovieInfoView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.08.2024.
//

import Foundation
import UIKit

protocol MovieInfoViewOutput: AnyObject {
    
}

protocol MovieInfoViewInput {
    
    var output: MovieInfoViewOutput? { get set }
    
    func presentMovie(movie: Movie)
    
}

class MovieInfoView: UIView, MovieInfoViewInput {
    
    func presentMovie(movie: Movie) {
        self.movie = movie
        titleLabel.text = movie.title
        let genres = Genre.getGenres(by: movie.genreIDS)
        genreLabel.text = movie.backdropPath
        imageView.sd_setImage(with: URL(string: "\(APIs.Image.baseURL)\(movie.posterPath)"))
    }
    
    
    weak var output: MovieInfoViewOutput?
    
    private var movie: Movie?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var votesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .black
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(votesLabel)
        addSubview(genreLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
            imageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            genreLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    
    
}
