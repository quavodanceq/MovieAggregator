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
    
    private var currentPage: Int = 1
    
    var delegate: CustomCellDelegate?
    
    var offset: CGPoint = .zero
    
    

    let collectionView: UICollectionView
    private var items: [String] = ["1","2","3","4"] 

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
        collectionView.backgroundColor = .red
    }

    func configure(with items: [String]) {
        self.items = items
        collectionView.reloadData()
        print(cellSection)
    }
    
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let item = items[indexPath.row]
        cell.setup(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heidht = collectionView.frame.height
        let width = heidht / 1.7
        return CGSize(width: width, height: heidht )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        if indexPath.item == items.count - 1 {
            //print(offset)
            delegate?.didEndDisplayingLastItem(section: cellSection ?? 6666666, page: currentPage)
        }
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        offset = scrollView.contentOffset
        delegate?.collectionView(cellSection!, didScrollToContentOffset: scrollView.contentOffset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.item == items.count - 1 {
//            offset = collectionView.contentOffset
//            //print(offset)
//            delegate?.didEndDisplayingLastItem(section: cellSection ?? 6666666, page: currentPage)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(section: cellSection ?? 666666, row: indexPath.row)
    }
}

protocol CustomCellDelegate {
    
    func didSelectItem(section: Int, row: Int)
    
    func didEndDisplayingLastItem(section: Int, page: Int)
    
    func collectionView(_ collectionView: Int, didScrollToContentOffset contentOffset: CGPoint)
    
}


