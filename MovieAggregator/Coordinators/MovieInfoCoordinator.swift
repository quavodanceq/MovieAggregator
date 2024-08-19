//
//  MovieInfoCoordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 19.08.2024.
//

import Foundation
import UIKit

class MovieInfoCoordinator: Coordinator <Void, Void> {
    
    private var module: (UIViewController & MovieInfoPresenterInput)?
    
    private let moduleAssembly: () -> UIViewController & MovieInfoPresenterInput
    
    init(moduleAssembly: @escaping () -> UIViewController & MovieInfoPresenterInput) {
        self.moduleAssembly = moduleAssembly
    }
    
    override func start(param: Void) {
        var module = moduleAssembly()
        module.output = self
        self.module = module
    }
    
    
    
    
}

extension MovieInfoCoordinator: MovieInfoPresenterOutput {
    
    
    
}
