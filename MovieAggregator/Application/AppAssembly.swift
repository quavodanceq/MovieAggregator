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
            MainScreenCoordinator(moduleAssembly: MainScreenAssembly.assembly, movieInfoCoordinatorAssembly: { root in
                return MovieInfoCoordinator(moduleAssembly: MovieInfoAssembly.assembly, initialController: root, playerCoordinatorAssembly: { root in
                    return PlayerCoordinator(moduleAssembly: PlayerAssembly.assembly, initialController: root)
                })
            })
        } bookmarkCoordinatorAssembly: {
            return BookmarksCoordinator(moduleAssembly: BookmarksAssembly.assembly)
        }
    }
}


