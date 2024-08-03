//
//  HeaderView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 27.07.2024.
//

import Foundation
import UIKit

class HeaderView: UICollectionReusableView {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .white
        label.text = "1111111"
        
                
        label.textAlignment = .left
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100)) // Замените на ваши размеры
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            // Создайте группу, добавив элемент
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100)) // Замените на ваши размеры
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            // Создание секции
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 10

            // Определение заголовка
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

            // Добавление заголовка в секцию
            section.boundarySupplementaryItems = [header]

            // Создание макета
            let layout = UICollectionViewCompositionalLayout(section: section)

            return layout
    }

    
}

