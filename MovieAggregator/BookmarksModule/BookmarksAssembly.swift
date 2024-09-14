//  
//  BookmarksAssembly.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import UIKit

final class BookmarksAssembly {
    
    static func assembly() -> UIViewController & BookmarksPresenterInput {
        let interactor = BookmarksInteractor()
        let presenter = BookmarksPresenter(interactor: interactor) {
        BookmarksView()
        }
        interactor.output = presenter
        return presenter
    }}
