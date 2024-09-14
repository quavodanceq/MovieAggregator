//  
//  BookmarksInteractor.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation

protocol BookmarksInteractorInput {
    
    var output: BookmarksInteractorOutput? { get set }
    
}

protocol BookmarksInteractorOutput: AnyObject {
    
}

class BookmarksInteractor: BookmarksInteractorInput {
    
    
    weak var output: BookmarksInteractorOutput?
    
}
