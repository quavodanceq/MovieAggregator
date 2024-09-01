//
//  MainScreenCoordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

class MainScreenCoordinator: Coordinator <Void, UIViewController> {
    
    private var module: (UIViewController & MainScreenPresenterInput)?
    
    private let moduleAssembly: () -> UIViewController & MainScreenPresenterInput
    
    private let movieInfoCoordinatorAssembly: (_ root: UIViewController) -> Coordinator<Movie, Void>
    
    private var movieInfoCoordinator: Coordinator<Movie, Void>?
    
    init(moduleAssembly: @escaping () -> UIViewController & MainScreenPresenterInput, movieInfoCoordinatorAssembly: @escaping (_ root: UIViewController) -> Coordinator<Movie, Void>) {
        self.moduleAssembly = moduleAssembly
        self.movieInfoCoordinatorAssembly = movieInfoCoordinatorAssembly
    }
    
    override func start(param: Void) {
        var module = moduleAssembly()
        module.output = self
        self.module = module
        initFinishFlow?(module)
    }
    
    
    
    
}

extension MainScreenCoordinator: MainScreenPresenterOutput {
    
    func presentMovieInfo(with movie: Movie) {
        guard let root = module else { return }
        let coordinator = movieInfoCoordinatorAssembly(root)
        self.movieInfoCoordinator = coordinator
        coordinator.start(param: movie)
    }
    
    
}
