//  
//  PlayerInteractor.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.09.2024.
//

import Foundation

protocol PlayerInteractorInput {
    
    var output: PlayerInteractorOutput? { get set }
    
}

protocol PlayerInteractorOutput: AnyObject {
    
}

class PlayerInteractor: PlayerInteractorInput {
    
    
    weak var output: PlayerInteractorOutput?
    
}
