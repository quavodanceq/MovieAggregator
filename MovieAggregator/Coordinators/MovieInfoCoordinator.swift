//
//  MovieInfoCoordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 19.08.2024.
//

import Foundation
import UIKit

class MovieInfoCoordinator: Coordinator <Movie, Void> {
    
    private var module: (UIViewController & MovieInfoPresenterInput)?
    
    private let moduleAssembly: () -> UIViewController & MovieInfoPresenterInput
    
    private let initialController: UIViewController
    
    var movie: Movie?
    
    init(moduleAssembly: @escaping () -> UIViewController & MovieInfoPresenterInput, initialController: UIViewController) {
        self.moduleAssembly = moduleAssembly
        self.initialController = initialController
    }
    
    override func start(param: Movie) {
        var module = moduleAssembly()
        module.output = self
        self.module = module
        module.movieToPresent(movie: param)
        initialController.present(module, animated: true)
    }
    
    
    
}

extension MovieInfoCoordinator: MovieInfoPresenterOutput {
    
    
    
}
