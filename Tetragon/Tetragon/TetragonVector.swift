//
//  TetragonVector.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import UIKit

struct TGVector {
    
    var start : CGPoint = CGPointZero
    var end : CGPoint = CGPointZero
    var distance : CGFloat {
        get {
            return getDistance()
        }
    }
    
    init() {
        
    }
    
    init (start start_I:CGPoint,end end_I:CGPoint) {
        
        start = start_I
        end = end_I
        
    }
    
    private func getDistance() -> CGFloat {
        
        let xDistance = (end.x - start.x)
        let yDistance = (end.y - start.y)
        return sqrt((xDistance * xDistance) + (yDistance * yDistance))
        
    }
    
}