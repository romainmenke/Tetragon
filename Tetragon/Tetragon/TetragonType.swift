//
//  TetragonTypeA.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import Foundation

extension Tetragon {
    
    // type
    
    public var type : TetragonType {
        get {
            return getType()
        }
    }
    
    private func getType() -> TetragonType {
        
        if allAngles90() && allSidesAreEqualLength() {
            return TetragonType.Square
        } else if allAngles90() {
            return TetragonType.Oblong
        } else if allSidesAreEqualLength() {
            return TetragonType.Rhombus
        }
        
        if opposingSidesAreEqualLength() {
            if !allSidesAreEqualLength() && !allAngles90() {
                return TetragonType.Rhomboid
            }
        }
        
        if twoAdjacentPairsOfSidesAreEqual() && oppositeRightAngles() {
            return TetragonType.RightKite
        } else if twoAdjacentPairsOfSidesAreEqual() {
            return TetragonType.Kite
        }
        
        return TetragonType.IrregularQuadrilateral
        
    }
    
    private func allSidesAreEqualLength() -> Bool {
        return topVectorLength == leftVectorLength && topVectorLength == rightVectorLength && topVectorLength == bottomVectorLength
    }
    
    private func opposingSidesAreEqualLength() -> Bool {
        
        return topVectorLength == bottomVectorLength || leftVectorLength == rightVectorLength
        
    }
    
    private func allAnglesEqual() -> Bool {
        
        return bottomLeftCorner.angleDegrees == topLeftCorner.angleDegrees && bottomLeftCorner.angleDegrees == topRightCorner.angleDegrees && bottomLeftCorner.angleDegrees == bottomRightCorner.angleDegrees
        
    }
    
    private func allAngles90() -> Bool {
        
        return bottomLeftCorner.angleDegrees == 90 && topLeftCorner.angleDegrees == 90 && topRightCorner.angleDegrees == 90
        
    }
    
    private func twoAdjacentPairsOfSidesAreEqual() -> Bool {
        
        if topVectorLength == rightVectorLength && bottomVectorLength == leftVectorLength {
            return true
        } else if topVectorLength == leftVectorLength && bottomVectorLength == rightVectorLength {
            return true
        } else {
            return false
        }
    }
    
    private func oppositeRightAngles() -> Bool {
        
        if bottomLeftCorner.angleDegrees == 90 && topRightCorner.angleDegrees == 90 {
            return true
        } else if topLeftCorner.angleDegrees == 90 && bottomRightCorner.angleDegrees == 90 {
            return true
        } else {
            return false
        }
    }
    
}