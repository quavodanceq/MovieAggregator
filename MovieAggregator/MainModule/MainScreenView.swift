//  
//  MainScreenView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

protocol MainScreenViewOutput: AnyObject {
    
}

protocol MainScreenViewInput {
    
    var output: MainScreenViewOutput? { get set }
    
    func setup()
    
}

class MainScreenView: UIView, MainScreenViewInput {
    
    weak var output: MainScreenViewOutput?
    
    var collectionViewContentOffsets: [Int: CGPoint] = [:]
    
    private var tableView = UITableView()
    
    private var data = [["1","2","3","4"], ["5","6","7","8"], ["9","10","11","12"]]
    
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
        cell.configure(with: data)
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
        data[section].append(contentsOf: ["1","2","3","4","5"])
        tableView.reloadSections(IndexSet(integer: section), with: .none)
        
    }
    
    
    func didSelectItem(section: Int, row: Int) {
        
    }
    
    func collectionView(_ collectionView: Int, didScrollToContentOffset contentOffset: CGPoint) {
        
        
        
        collectionViewContentOffsets[collectionView] = contentOffset
        
        }
    
}
