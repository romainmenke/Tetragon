//
//  TetragonVectorCalc.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import UIKit

extension Tetragon {
    
    // Vector Distance Area
    
    public var area : CGFloat {
        get {
            let area1 = 0.5 * topVectorLength * rightVectorLength * sin(topRightCorner.angleRadians)
            let area2 = 0.5 * bottomVectorLength * leftVectorLength * sin(bottomLeftCorner.angleRadians)
            return area1 + area2
        }
    }
    
    var leftVector : TGVector {
        get {
            return TGVector(start:bottomLeftCorner.vertex, end:topLeftCorner.vertex)
        }
    }
    var topVector : TGVector {
        get {
            return TGVector(start:topLeftCorner.vertex, end:topRightCorner.vertex)
        }
    }
    var rightVector : TGVector {
        get {
            return TGVector(start:topRightCorner.vertex, end:bottomRightCorner.vertex)
        }
    }
    var bottomVector : TGVector {
        get {
            return TGVector(start:bottomRightCorner.vertex, end:bottomLeftCorner.vertex)
        }
    }
    var topLeftBottomRightVector : TGVector {
        get {
            return TGVector(start:topLeftCorner.vertex, end:bottomRightCorner.vertex)
        }
    }
    var topRightBottomLeftVector : TGVector {
        get {
            return TGVector(start:topRightCorner.vertex, end:bottomLeftCorner.vertex)
        }
    }
    
    var leftVectorLength : CGFloat {
        get {
            return leftVector.distance
        }
    }
    var topVectorLength : CGFloat {
        get {
            return topVector.distance
        }
    }
    var rightVectorLength : CGFloat {
        get {
            return rightVector.distance
        }
    }
    var bottomVectorLength : CGFloat {
        get {
            return bottomVector.distance
        }
    }
    var topLeftBottomRightVectorLength : CGFloat {
        get {
            return topLeftBottomRightVector.distance
        }
    }
    var topRightBottomLeftVectorLength : CGFloat {
        get {
            return topRightBottomLeftVector.distance
        }
    }
    
    
}