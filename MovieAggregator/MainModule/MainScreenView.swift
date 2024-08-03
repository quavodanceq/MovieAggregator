//  
//  MainScreenView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    func didScrollToEnd(of section: Int, page: Int)
    
    func didScrollToEndOfTableView(sectionsRange sections: ClosedRange<Int>)
    
}

protocol MainScreenViewInput {
    
    var output: MainScreenViewOutput? { get set }
    
    func setup()
    
    func displayMovieSections(movies : [MovieSection])
    
    func displayMoviesFor(moviesSection: MovieSection)
    
    func displayTrendingMovie(movie: Movie)
    
    var sectionsRange: ClosedRange<Int> { get }
    
}

class MainScreenView: UIView, MainScreenViewInput {
    
    
    
    
    func displayTrendingMovie(movie: Movie) {
        movieView.setup(movie)
    }
    
    func displayMoviesFor(moviesSection: MovieSection) {
        data[moviesSection.section].movies.append(contentsOf: moviesSection.movies)
        data[moviesSection.section].currentPage = moviesSection.currentPage
        tableView.reloadSections(IndexSet(integer: moviesSection.section), with: .automatic)
    }
    
    weak var output: MainScreenViewOutput?
    
    var collectionViewContentOffsets: [Int: CGPoint] = [:]
    
    private let movieView = MovieView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5))
    
    private var tableView = UITableView()
    
    private var data: [MovieSection] = []
    
    private var firstSectionIndex: Int = 0
    
    var sectionsRange: ClosedRange<Int> {
        firstSectionIndex...firstSectionIndex + 4
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupTableView()
        setupConstrainst()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.tableHeaderView = movieView
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstrainst() {
        
       
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func displayMovieSections(movies : [MovieSection]) {
        self.data.append(contentsOf: movies)
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
    }
    
}

extension MainScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.cellSection = indexPath.section
        let data = data[indexPath.section]
        cell.configure(with: data.movies, page: data.currentPage)
        if let savedContentOffset = collectionViewContentOffsets[indexPath.section] {
            //                cell.collectionView.setContentOffset(savedContentOffset, animated: false)
            cell.offset = savedContentOffset
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.frame.height / 2.7
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == data.count - 1 {
            firstSectionIndex += 5
            output?.didScrollToEndOfTableView(sectionsRange: sectionsRange)
        }
    }
    
    
}

extension MainScreenView: CustomCellDelegate {
    
    func didEndDisplayingLastItem(section: Int, page: Int) {
        
        output?.didScrollToEnd(of: section, page: page)
        
    }
    
    
    func didSelectItem(section: Int, row: Int) {
        
    }
    
    func collectionView(_ collectionView: Int, didScrollToContentOffset contentOffset: CGPoint) {
        
        
        
        collectionViewContentOffsets[collectionView] = contentOffset
        
        print(collectionViewContentOffsets[collectionView]?.x)
        
        }
    
        
    
}
