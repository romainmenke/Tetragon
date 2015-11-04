//
//  TetragonCorner.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import UIKit


struct TGCorner {
    
    var vertex : CGPoint = CGPointZero
    var ray1 : CGPoint = CGPointZero
    var ray2 : CGPoint = CGPointZero
    
    var angleDegrees : CGFloat {
        get {
            return getAngleDegrees()
        }
    }
    var angleRadians : CGFloat {
        get {
            return getAngleRadians()
        }
    }
    
    init() {
        
    }
    
    init (vertex vertex_I:CGPoint,ray1 ray1_I:CGPoint,ray2 ray2_I:CGPoint) {
        
        vertex = vertex_I
        ray1 = ray1_I
        ray2 = ray2_I
        
    }
    
    func getAngleRadians() -> CGFloat {
        
        let xVector : TGVector = TGVector(start:vertex, end:ray1)
        let yVector : TGVector = TGVector(start:ray1, end:ray2)
        let zVector : TGVector = TGVector(start:vertex, end:ray2)
        
        let x = xVector.distance
        let y = yVector.distance
        let z = zVector.distance
        
        let alpha = (x * x + z * z - y * y)
        let beta = (2 * x * z)
        
        return acos(alpha / beta)
        
    }
    
    func getAngleDegrees() -> CGFloat {
        
        let radians = getAngleRadians()
        return radians * 180 / CGFloat(M_PI)
        
    }
    
}

func ==(lhs: TGCorner, rhs: TGCorner) -> Bool {
    return lhs.vertex == rhs.vertex && lhs.ray1 == rhs.ray1 && lhs.ray2 == rhs.ray2
}

func !=(lhs: TGCorner, rhs: TGCorner) -> Bool {
    return !(lhs == rhs)
}