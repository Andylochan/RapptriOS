//
//  UIView+Extensions.swift
//  Rapptr iOS Test
//
//  Created by Andy Lochan on 8/14/21.
//

import UIKit

// MARK:- Fade
public extension UIView {
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }

    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
}
