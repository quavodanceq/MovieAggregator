//  
//  PlayerView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.09.2024.
//

import Foundation
import UIKit

protocol PlayerViewOutput: AnyObject {
    
}

protocol PlayerViewInput {
    
    var output: PlayerViewOutput? { get set }
    
}

class PlayerView: UIView, PlayerViewInput {
    
    weak var output: PlayerViewOutput?
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
