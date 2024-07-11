//
//  AppAssembly.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

class AppAssembly {
    
    static func assembly(window: UIWindow) -> Coordinator<Void, Void> {
        
        MainTabBarCoordinator(window: window) {
            MainScreenCoordinator(moduleAssembly: MainScreenAssembly.assembly)
        }
        
    }
    
}
