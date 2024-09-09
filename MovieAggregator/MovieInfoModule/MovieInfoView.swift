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
        let voteAverageString = String(format: "%.1f", movie.voteAverage)
        let voteCountString = movie.voteCount.asKFormat

        let fullString = "\(voteAverageString) \(voteCountString)"
        let attributedString = NSMutableAttributedString(string: fullString)

        let firstWordRange = (fullString as NSString).range(of: voteAverageString)
        let voteAverageTextColor: UIColor
        if movie.voteAverage < 7 {
            voteAverageTextColor = UIColor.gray
        } else if movie.voteAverage >= 8 {
            voteAverageTextColor = UIColor.yellow
        }
        else {
            voteAverageTextColor = .green
        }
        attributedString.addAttribute(.foregroundColor, value: voteAverageTextColor, range: firstWordRange)

        votesLabel.attributedText = attributedString
        //votesLabel.text = "\(String(format: "%.1f", movie.voteAverage)) \(movie.voteCount.asKFormat)"
        genreLabel.text = "\(movie.releaseDate.prefix(4)), \(Genre.getGenres(by: movie.genreIDS).stringRep())"
        imageView.sd_setImage(with: URL(string: "\(APIs.Image.baseURL)\(movie.backdropPath)"))
        countryLabel.text = movie.originalLanguage
        overviewLabel.text = movie.overview
    }
    
    
    weak var output: MovieInfoViewOutput?
    
    private var movie: Movie?
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
        
    }()
    
    private let cView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.cochin, .bold, size: 25)
        label.textAlignment = .center
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var votesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playButton: PlayButton = {
        let playButton = PlayButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return playButton
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.appleSDGothicNeo, .bold, size: 17)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
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
        addSubview(scrollView)
        scrollView.addSubview(cView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(votesLabel)
        scrollView.addSubview(genreLabel)
        scrollView.addSubview(countryLabel)
        scrollView.addSubview(playButton)
        scrollView.addSubview(overviewLabel)
    }
    
    private func setupConstraints() {
        
        let hConstr = cView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConstr.isActive = true
        hConstr.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            cView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: cView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5625),
            imageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: cView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            votesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            votesLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor),
            votesLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
            votesLabel.centerXAnchor.constraint(equalTo: cView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: votesLabel.bottomAnchor, constant: 10),
            genreLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
            genreLabel.centerXAnchor.constraint(equalTo: cView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor),
            countryLabel.centerXAnchor.constraint(equalTo: cView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10),
            playButton.centerXAnchor.constraint(equalTo: cView.centerXAnchor),
            playButton.widthAnchor.constraint(equalTo: cView.widthAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 25),
            overviewLabel.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -20),
            overviewLabel.centerXAnchor.constraint(equalTo: cView.centerXAnchor),
            overviewLabel.bottomAnchor.constraint(equalTo: cView.bottomAnchor)
        ])
    }
    
    @objc private func playButtonTapped() {
        print("tapped")
    }
}
