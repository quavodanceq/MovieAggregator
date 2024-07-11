//  
//  MainScreenPresenter.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainScreenPresenter: MainScreenViewOutput {
    
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    
}
