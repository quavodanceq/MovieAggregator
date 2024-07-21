//  
//  MainScreenPresenter.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation
import UIKit

protocol MainScreenPresenterInput {
    
    var output: MainScreenPresenterOutput? { get set }
    
}

protocol MainScreenPresenterOutput: AnyObject {
    
}

class MainScreenPresenter: UIViewController, MainScreenPresenterInput {
    
    weak var output: MainScreenPresenterOutput?
    
    private let interactor: MainScreenInteractorInput
    private let viewAssembly: () -> UIView & MainScreenViewInput
    private lazy var viewRef = viewAssembly()
    
    init(interactor: MainScreenInteractorInput, view: @escaping () -> UIView & MainScreenViewInput ) {
        self.interactor = interactor
        self.viewAssembly = view
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        
        view = viewRef
        viewRef.output = self
    }
    
    override func viewDidLoad() {
        
        interactor.fetchMovies(for: viewRef.sectionsRange)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainScreenPresenter: MainScreenViewOutput {
    
    func didScrollToEndOfTableView(sectionsRange sections: ClosedRange<Int>) {
        interactor.fetchMovies(for: sections)
    }
    
    func didScrollToEnd(of section: Int, page: Int) {
        interactor.fetchMoviesForSection(section: section, page: page)
    }
    
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    
    func moviesWasFetched(movies: [MovieSection]) {
        viewRef.displayMovieSections(movies: movies)
    }
    
    
    func moviesForSectionWasFetched(moviesSection: MovieSection) {
        viewRef.displayMoviesFor(moviesSection: moviesSection)
    }
    
    
    
    
}
