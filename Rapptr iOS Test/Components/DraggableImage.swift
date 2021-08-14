//
//  DraggableImage.swift
//  Rapptr iOS Test
//
//  Created by Andy Lochan on 8/14/21.
//

import UIKit

// MARK:- Image Drag
class DraggableImage: UIImageView {
    
    var localTouchPosition : CGPoint?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        self.localTouchPosition = touch?.preciseLocation(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first
        guard let location = touch?.location(in: self.superview), let localTouchPosition = self.localTouchPosition else{
            return
        }
        self.frame.origin = CGPoint(x: location.x - localTouchPosition.x, y: location.y - localTouchPosition.y)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.localTouchPosition = nil
    }
}
