//  
//  MainScreenView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    func fetchMovies(for section: Int, page: Int)
    
}

protocol MainScreenViewInput {
    
    var output: MainScreenViewOutput? { get set }
    
    func setup()
    
    func getMovies(movies : [MovieSection])
    
    func getMoviesForSection(moviesSection: MovieSection)
    
}

class MainScreenView: UIView, MainScreenViewInput {
    
    
    func getMoviesForSection(moviesSection: MovieSection) {
        data[moviesSection.section] = moviesSection
        tableView.reloadSections(IndexSet(integer: moviesSection.section), with: .automatic)
    }
    
    
    
    weak var output: MainScreenViewOutput?
    
    var collectionViewContentOffsets: [Int: CGPoint] = [:]
    
    private var tableView = UITableView()
    
    private var data: [MovieSection] = []
    
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
        backgroundColor = .orange
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
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
        self.data = movies
        self.tableView.reloadData()
        
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
        cell.delegate = self
        let data = data[indexPath.section]
        cell.configure(with: data.movies, page: data.currentPage)
        if let savedContentOffset = collectionViewContentOffsets[indexPath.section] {
                cell.collectionView.setContentOffset(savedContentOffset, animated: false)
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let label = UILabel()
        label.text = "123"
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
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
        
        }
    
}
