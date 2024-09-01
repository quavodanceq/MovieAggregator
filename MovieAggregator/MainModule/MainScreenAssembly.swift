//  
//  MainScreenBuilder.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import UIKit

final class MainScreenAssembly {
    
    static func assembly() -> UIViewController & MainScreenPresenterInput {
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(interactor: interactor) {
        MainScreenView()
        }
        interactor.output = presenter
        return presenter
    }}


