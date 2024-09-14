//
//  TabBarCoordinator.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

class MainTabBarCoordinator: Coordinator<Void, Void> {
    
    private let window: UIWindow
    
    private var tabBarController = UITabBarController()
    
    private var mainScreenCoordinator: Coordinator<Void, UIViewController>?
    private let mainScreenCoordinatorAssembly: () -> Coordinator<Void, UIViewController>
    
    private var bookmarkCoordinator: Coordinator<Void, UIViewController>?
    private let bookmarkCoordinatorAssembly: () -> Coordinator<Void, UIViewController>
    
    init(window: UIWindow,
        mainScreenCoordinatorAssembly: @escaping () -> Coordinator<Void, UIViewController>,
        bookmarkCoordinatorAssembly: @escaping () -> Coordinator<Void, UIViewController>) {
        self.window = window
        self.mainScreenCoordinatorAssembly = mainScreenCoordinatorAssembly
        self.bookmarkCoordinatorAssembly = bookmarkCoordinatorAssembly
        
    }
    
    override func start(param: Void) {
        var mainScreenCoordinator = mainScreenCoordinatorAssembly()
        self.mainScreenCoordinator = mainScreenCoordinator
        mainScreenCoordinator.initFinishFlow = { mainScreenModule in
            mainScreenModule.tabBarItem =  UITabBarItem(title: "Main", image: UIImage(systemName: "ipad"), tag: 0)
            self.tabBarController.addChild(mainScreenModule)
        }
        mainScreenCoordinator.start()
        var bookmarksCoordinator = bookmarkCoordinatorAssembly()
        self.bookmarkCoordinator = bookmarksCoordinator
        bookmarksCoordinator.initFinishFlow = { bookmarkModule in
            bookmarkModule.tabBarItem =  UITabBarItem(title: "Main", image: UIImage(systemName: "ipad"), tag: 0)
            self.tabBarController.addChild(bookmarkModule)
        }
        bookmarksCoordinator.start()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
}




