//  
//  PlayerView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 10.09.2024.
//

import Foundation
import UIKit
import AVKit

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
    
    private func setup() {
        backgroundColor = .red
        let url = Bundle.main.url(forResource: "trailer", withExtension: "mp4")
        let player = AVPlayer(url: url!)
        let controller = AVPlayerViewController()
        controller.player = player
        player.play()
    }
    
}
