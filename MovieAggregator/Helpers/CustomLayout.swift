//
//  CustomLayout.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 27.07.2024.
//

import Foundation
import UIKit

class CustomLayout: UICollectionViewLayout {
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentWidth: CGFloat = 0
    private var headerHeight: CGFloat = 50 // Высота заголовка
    
    override var collectionViewContentSize: CGSize {
        let heidht = collectionView?.frame.height
        let width = heidht! / 1.7
        return CGSize(width: max(contentWidth, collectionView?.bounds.width ?? 0), height: (collectionView?.bounds.height ?? 0) + headerHeight)
    }

    override func prepare() {
        guard let collectionView = collectionView else { return }

        cache.removeAll()
        contentWidth = 0

        let numberOfSections = collectionView.numberOfSections

        for section in 0..<numberOfSections {
            // Создаем заголовок
            let headerIndexPath = IndexPath(item: 0, section: section)
            let headerAttributes = UICollectionViewLayoutAttributes(
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                with: headerIndexPath
            )
            // Заголовок располагается вверху
            headerAttributes.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: headerHeight)
            cache.append(headerAttributes)

            // Расположение ячеек
            var xOffset: CGFloat = 0
            let numberOfItems = collectionView.numberOfItems(inSection: section)

            for item in 0..<numberOfItems {
                let itemIndexPath = IndexPath(item: item, section: section)
                
                let heidht = collectionView.frame.height
                let width = heidht / 1.7

                // Получаем размеры ячейки (например, 100x100)
                let itemSize: CGSize = CGSize(width: width, height: heidht) // Замените на ваши размеры

                let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: itemIndexPath)
                // Позиционирование ячеек: y = headerHeight (под заголовком), x = xOffset (горизонтально)
                itemAttributes.frame = CGRect(x: xOffset, y: headerHeight, width: itemSize.width, height: itemSize.height)

                cache.append(itemAttributes)
                xOffset += itemSize.width // Увеличиваем xOffset для следующей ячейки
            }

            contentWidth = max(contentWidth, xOffset); // Установка ширины контента
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache.filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item + (indexPath.section * (collectionView?.numberOfItems(inSection: indexPath.section) ?? 0) + 1)] // +1 для заголовка
    }

    override func layoutAttributesForSupplementaryView(ofKind kind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if kind == UICollectionView.elementKindSectionHeader {
            return cache[indexPath.section * 2] // Заголовки идут перед ячейками в массиве кэша
        }
        return nil
    }
}
