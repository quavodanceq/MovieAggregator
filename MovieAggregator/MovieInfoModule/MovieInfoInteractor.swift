//  
//  MovieInfoInteractor.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.08.2024.
//

import Foundation

protocol MovieInfoInteractorInput {
    
    var output: MovieInfoInteractorOutput? { get set }
    
}

protocol MovieInfoInteractorOutput: AnyObject {
    
}

class MovieInfoInteractor: MovieInfoInteractorInput {
    
    
    weak var output: MovieInfoInteractorOutput?
    
}
