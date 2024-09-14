//  
//  BookmarksPresenter.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation
import UIKit

protocol BookmarksPresenterInput {
    
    var output: BookmarksPresenterOutput? { get set }
    
}

protocol BookmarksPresenterOutput: AnyObject {
    
}

class BookmarksPresenter: UIViewController, BookmarksPresenterInput {
    
    weak var output: BookmarksPresenterOutput?
    
    private let interactor: BookmarksInteractorInput
    private let viewAssembly: () -> UIView & BookmarksViewInput
    private lazy var viewRef = viewAssembly()
    
    init(interactor: BookmarksInteractorInput, view: @escaping () -> UIView & BookmarksViewInput ) {
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

extension BookmarksPresenter: BookmarksViewOutput {
    
}

extension BookmarksPresenter: BookmarksInteractorOutput {
    
}
