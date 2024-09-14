//
//  BookmarksCoordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation
import UIKit

class BookmarksCoordinator: Coordinator <Void, UIViewController> {
    
    private var module: (UIViewController & BookmarksPresenterInput)?
    
    private let moduleAssembly: () -> UIViewController & BookmarksPresenterInput
    
    init(moduleAssembly: @escaping () -> UIViewController & BookmarksPresenterInput) {
        self.moduleAssembly = moduleAssembly
    }
    
    override func start(param: Void) {
        var module = moduleAssembly()
        module.output = self
        self.module = module
        initFinishFlow?(module)
    }
    
}

extension BookmarksCoordinator: BookmarksPresenterOutput {
    
   
    
    
}
