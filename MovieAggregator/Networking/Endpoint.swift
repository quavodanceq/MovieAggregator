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
    
}
