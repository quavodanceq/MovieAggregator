//  
//  PlayerPresenter.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.09.2024.
//

import Foundation
import UIKit

protocol PlayerPresenterInput {
    
    var output: PlayerPresenterOutput? { get set }
    
}

protocol PlayerPresenterOutput: AnyObject {
    
}

class PlayerPresenter: UIViewController, PlayerPresenterInput {
    
    weak var output: PlayerPresenterOutput?
    
    private let interactor: PlayerInteractorInput
    private let viewAssembly: () -> UIView & PlayerViewInput
    private lazy var viewRef = viewAssembly()
    
    init(interactor: PlayerInteractorInput, view: @escaping () -> UIView & PlayerViewInput ) {
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

extension PlayerPresenter: PlayerViewOutput {
    
}

extension PlayerPresenter: PlayerInteractorOutput {
    
}
