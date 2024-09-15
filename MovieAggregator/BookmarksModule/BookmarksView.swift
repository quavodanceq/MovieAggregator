//  
//  BookmarksView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation
import UIKit
import Combine

protocol BookmarksViewOutput: AnyObject {
    
}

protocol BookmarksViewInput {
    
    var output: BookmarksViewOutput? { get set }
    
}

class BookmarksView: UIView, BookmarksViewInput {
    
    weak var output: BookmarksViewOutput?
    
    private var collectionView: UICollectionView!
    
    private var cancellable: Set<AnyCancellable> = []
    
    private var movies: [Movie] = []
    
    init() {
        super.init(frame: .zero)
        setupCollectionView()
        setupConstraints()
        setupPublisher()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPublisher() {
        
        UserDefaults.standard.publisher(for: \.observableProductsData)
            .map{ data -> [Movie] in
                guard let data = data else { return [] }
                return (try? JSONDecoder().decode([Movie].self, from: data)) ?? []
            }.sink { movies in
                
                self.movies = movies
                print(movies)
                self.collectionView.reloadData()
            }.store(in: &cancellable)
        
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
}

extension BookmarksView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.setup(movies[indexPath.row])
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)
        return CGSize(width: size, height: size * 1.2 )
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let product = products[indexPath.row]
//            presenter?.showProductPage(product: product)
//    }
    
    
}
