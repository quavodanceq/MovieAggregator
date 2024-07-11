//  
//  MainScreenView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

protocol MainScreenViewOutput: AnyObject {
    
}

protocol MainScreenViewInput {
    
    var output: MainScreenViewOutput? { get set }
    
}

class MainScreenView: UIView, MainScreenViewInput {
    
    weak var output: MainScreenViewOutput?
    
    init() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
