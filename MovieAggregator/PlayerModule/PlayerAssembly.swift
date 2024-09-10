//  
//  PlayerAssembly.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.09.2024.
//

import UIKit

final class PlayerAssembly {
    
    static func assembly() -> UIViewController & PlayerPresenterInput {
        let interactor = PlayerInteractor()
        let presenter = PlayerPresenter(interactor: interactor) {
        PlayerView()
        }
        interactor.output = presenter
        return presenter
    }}
