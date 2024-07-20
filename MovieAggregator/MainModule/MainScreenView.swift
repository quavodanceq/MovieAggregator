//  
//  MainScreenView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    func fetchMovies(for sections: Int, page: Int)
    
    func fetchMoviesSections(for sections: ClosedRange<Int>)
    
}

protocol MainScreenViewInput {
    
    var output: MainScreenViewOutput? { get set }
    
    func setup()
    
    func getMovies(movies : [MovieSection])
    
    func getMoviesForSection(moviesSection: MovieSection)
    
    var sectionsRange: ClosedRange<Int> { get }
    
}

class MainScreenView: UIView, MainScreenViewInput {
    
    
    func getMoviesForSection(moviesSection: MovieSection) {
        data[moviesSection.section].movies.append(contentsOf: moviesSection.movies)
        data[moviesSection.section].currentPage = moviesSection.currentPage
        tableView.reloadSections(IndexSet(integer: moviesSection.section), with: .automatic)
    }
    
    
    
    weak var output: MainScreenViewOutput?
    
    var collectionViewContentOffsets: [Int: CGPoint] = [:]
    
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
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .black
        addSubview(tableView)
        backgroundColor = .orange
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstrainst() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func getMovies(movies : [MovieSection]) {
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let label = UILabel()
        label.text = "123"
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.frame.height / 2.7
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == data.count - 1 {
            firstSectionIndex += 5
            output?.fetchMoviesSections(for: sectionsRange)
        }
    }
    
    
}

extension MainScreenView: CustomCellDelegate {
    
    func didEndDisplayingLastItem(section: Int, page: Int) {
        
        output?.fetchMovies(for: section, page: page)
        
    }
    
    
    func didSelectItem(section: Int, row: Int) {
        
    }
    
    func collectionView(_ collectionView: Int, didScrollToContentOffset contentOffset: CGPoint) {
        
        
        
        collectionViewContentOffsets[collectionView] = contentOffset
        
        print(collectionViewContentOffsets[collectionView]?.x)
        
        }
    
        
    
}
