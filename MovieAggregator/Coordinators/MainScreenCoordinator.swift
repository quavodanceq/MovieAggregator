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
    
    init(moduleAssembly: @escaping () -> UIViewController & MainScreenPresenterInput) {
        self.moduleAssembly = moduleAssembly
    }
    
    override func start(param: Void) {
        var module = moduleAssembly()
        module.output = self
        self.module = module
        initFinishFlow?(module)
    }
    
    
    
    
}

extension MainScreenCoordinator: MainScreenPresenterOutput {
    
    
    
}
