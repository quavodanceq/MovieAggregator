//  
//  MainScreenInteractor.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation

protocol MainScreenInteractorInput {
    
    var output: MainScreenInteractorOutput? { get set }
    
}

protocol MainScreenInteractorOutput: AnyObject {
    
}

class MainScreenInteractor: MainScreenInteractorInput {
    
    
    weak var output: MainScreenInteractorOutput?
    
}
