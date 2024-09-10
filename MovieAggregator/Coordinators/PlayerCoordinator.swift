//
//  PlayerCoordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.09.2024.
//

import Foundation
import UIKit

class PlayerCoordinator: Coordinator <Void, Void> {
    
    private var module: (UIViewController & PlayerPresenterInput)?
    
    private let moduleAssembly: () -> UIViewController & PlayerPresenterInput
    
    private let initialController: UIViewController
    
    var movie: Movie?
    
    init(moduleAssembly: @escaping () -> UIViewController & PlayerPresenterInput, initialController: UIViewController) {
        self.moduleAssembly = moduleAssembly
        self.initialController = initialController
    }
    
    override func start(param: Void) {
        var module = moduleAssembly()
        module.output = self
        self.module = module
        initialController.present(module, animated: true)
    }
    
    
    
}

extension PlayerCoordinator: PlayerPresenterOutput {
 
    

}
