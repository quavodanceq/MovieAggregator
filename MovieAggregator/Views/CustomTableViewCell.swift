//
//  CustomTableViewCell.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 13.07.2024.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var cellSection: Int?
    
    private let label = UILabel()
    
    private var currentPage: Int = 1
    
    var delegate: CustomCellDelegate?
    
    var offset: CGPoint = .zero

    let collectionView: UICollectionView
    private var data: [Movie] = []
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        contentView.addSubview(collectionView)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
        collectionView.reloadData()
        collectionView.contentOffset = offset
        
        
    }

    func configure(with items: [Movie], page: Int) {
        self.data = items
        self.currentPage = page
        label.text = "\(Genre.getGenre(by: cellSection ?? 1).rawValue)"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.textColor = .white
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: contentView.topAnchor),
                    label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                   
                ])
    }
    
    
    
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
//            return header
//            
//        }
//        return UICollectionReusableView()
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 50, height: collectionView.bounds.height)
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let item = data[indexPath.row]
        cell.setup(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heidht = collectionView.frame.height - label.frame.height * 2
        let width = heidht / 1.7
        return CGSize(width: width, height: heidht )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        if indexPath.item == data.count - 1 {
            delegate?.didEndDisplayingLastItem(section: cellSection ?? 6666666, page: currentPage + 1)
        }
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset != .zero {
            delegate?.collectionView(cellSection!, didScrollToContentOffset: scrollView.contentOffset)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(section: cellSection ?? 666666, row: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: label.frame.height, left: 0, bottom: 0, right: 0)
    }
}

protocol CustomCellDelegate {
    
    func didSelectItem(section: Int, row: Int)
    
    func didEndDisplayingLastItem(section: Int, page: Int)
    
    func collectionView(_ collectionView: Int, didScrollToContentOffset contentOffset: CGPoint)
    
}


