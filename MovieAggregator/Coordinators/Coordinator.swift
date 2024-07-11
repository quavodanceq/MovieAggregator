//
//  Coordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

class Coordinator<Input, Result> {
    
    var finishFlow: ((Result) -> Void)?
    
    func start(param: Input) {
        assert(false, "Must be overriden by subclass")
    }
    
    var initFinishFlow: ((Result) -> Void)?
    
}

extension Coordinator where Input == Void {
    
    func start() {
        start(param: ())
    }
    
}



