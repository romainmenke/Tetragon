//
//  TetragonContainsPoint.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import UIKit

extension Tetragon {
    
    public func containsPoint(point: CGPoint) -> Bool {
        
        return path.containsPoint(point)
        
    }
}