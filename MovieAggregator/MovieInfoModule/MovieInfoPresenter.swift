//  
//  MovieInfoPresenter.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.08.2024.
//

import Foundation
import UIKit

protocol MovieInfoPresenterInput {
    
    var output: MovieInfoPresenterOutput? { get set }
    
    func movieToPresent(movie: Movie)
    
}

protocol MovieInfoPresenterOutput: AnyObject {
    
}

class MovieInfoPresenter: UIViewController, MovieInfoPresenterInput {
    
    func movieToPresent(movie: Movie) {
        viewRef.presentMovie(movie: movie)
    }
    
    
    weak var output: MovieInfoPresenterOutput?
    
    private let interactor: MovieInfoInteractorInput
    private let viewAssembly: () -> UIView & MovieInfoViewInput
    private lazy var viewRef = viewAssembly()
    
    init(interactor: MovieInfoInteractorInput, view: @escaping () -> UIView & MovieInfoViewInput ) {
        self.interactor = interactor
        self.viewAssembly = view
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = viewRef
        viewRef.output = self
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieInfoPresenter: MovieInfoViewOutput {
    
}

extension MovieInfoPresenter: MovieInfoInteractorOutput {
    
}
