//
//  Endpoint.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 20.07.2024.
//

import Foundation

protocol API {
    
    static var baseURL: URL { get }
    
}

enum APIs {
    
    enum Image: API {
        
        static let baseURL: URL = URL(string: "https://image.tmdb.org/t/p/original")!
        
    }
    
    enum Movie: API {
        
        static let baseURL: URL = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        
        static let topRated: URL = URL(string: "https://api.themoviedb.org/3/movie/top_rated")!
        
        static let trending: URL = URL(string: "https://api.themoviedb.org/3/movie/popular")!
        
    }
    
}
