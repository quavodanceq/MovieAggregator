//
//  Paddinglabel.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 20.07.2024.
//

import Foundation
import UIKit

class Paddinglabel: UILabel {
    
    var UIEI: UIEdgeInsets
    
    init(top: Int = 2, left: Int = 5, bottom: Int = 2, right: Int = 5) {
        self.UIEI = UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        override var intrinsicContentSize:CGSize {
            numberOfLines = 0
            var s = super.intrinsicContentSize
            s.height = s.height + UIEI.top + UIEI.bottom
            s.width = s.width + UIEI.left + UIEI.right
            return s
        }
        
        override func drawText(in rect:CGRect) {
            let r = rect.inset(by: UIEI)
            super.drawText(in: r)
        }
        
        override func textRect(forBounds bounds:CGRect,
                                   limitedToNumberOfLines n:Int) -> CGRect {
            let b = bounds
            let tr = b.inset(by: UIEI)
            let ctr = super.textRect(forBounds: tr, limitedToNumberOfLines: n)
            // that line of code MUST be LAST in this function, NOT first
            return ctr
        }

}
