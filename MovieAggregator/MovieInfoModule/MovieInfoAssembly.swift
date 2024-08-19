//  
//  MovieInfoAssembly.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.08.2024.
//

import UIKit

final class MovieInfoAssembly {
    
    static func assembly() -> UIViewController & MovieInfoPresenterInput {
        let interactor = MovieInfoInteractor()
        let presenter = MovieInfoPresenter(interactor: interactor) {
        MovieInfoView()
        }
        interactor.output = presenter
        return presenter
    }}
