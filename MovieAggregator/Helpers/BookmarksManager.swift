//
//  BookmarksManager.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation

class BookmarksManager {
    
    private init() {}
    
    static let shared = BookmarksManager()
    
    let userDefaults = UserDefaults.standard

    func add(_ movie: Movie) {
        
        userDefaults.movies.append(movie)
    }

    func remove(_ movie: Movie) {
        
        let movies = userDefaults.movies
        guard let index = movies.firstIndex(of: movie) else {return}
        userDefaults.movies.remove(at: index)
    }
}
