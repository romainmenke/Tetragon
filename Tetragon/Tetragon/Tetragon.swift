//
//  Tetragon.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import UIKit

public struct Tetragon {
    
    var bottomLeft : CGPoint {
        get {
            return bottomLeftCorner.vertex
        }
    }
    var topLeft : CGPoint {
        get {
            return topLeftCorner.vertex
        }
    }
    var topRight : CGPoint {
        get {
            return topRightCorner.vertex
        }
    }
    var bottomRight : CGPoint {
        get {
            return bottomRightCorner.vertex
        }
    }
    
    var bottomLeftCorner : TGCorner = TGCorner()
    var topLeftCorner : TGCorner = TGCorner()
    var topRightCorner : TGCorner = TGCorner()
    var bottomRightCorner : TGCorner = TGCorner()
    
    //let cornerRadius : CGFloat = 0
    
    
    public var path : UIBezierPath {
        get {
            
            let tempPath = UIBezierPath()
            tempPath.moveToPoint(bottomLeftCorner.vertex)
            tempPath.addLineToPoint(topLeftCorner.vertex)
            tempPath.addLineToPoint(topRightCorner.vertex)
            tempPath.addLineToPoint(bottomRightCorner.vertex)
            tempPath.addLineToPoint(bottomLeftCorner.vertex)
            return tempPath
        }
    }
    
    public var exclusionPaths : [UIBezierPath] {
        get {
            
            let excPath = UIBezierPath()
            let tempFrame = self.frame
            excPath.moveToPoint(tempFrame.origin)
            excPath.addLineToPoint(CGPoint(x: tempFrame.origin.x, y: tempFrame.size.height))
            excPath.addLineToPoint(CGPoint(x: tempFrame.size.width, y: tempFrame.size.height))
            excPath.addLineToPoint(CGPoint(x: tempFrame.size.width, y: tempFrame.origin.y))
            excPath.addLineToPoint(tempFrame.origin)
            excPath.addLineToPoint(bottomLeftCorner.vertex)
            excPath.addLineToPoint(topLeftCorner.vertex)
            excPath.addLineToPoint(topRightCorner.vertex)
            excPath.addLineToPoint(bottomRightCorner.vertex)
            excPath.addLineToPoint(bottomLeftCorner.vertex)
            excPath.addLineToPoint(tempFrame.origin)
            
            return [excPath]
            
        }
    }
    
    public var frame : CGRect {
        get {
            let highestPoint = max(topLeftCorner.vertex.y, topRightCorner.vertex.y, bottomLeftCorner.vertex.y, bottomRightCorner.vertex.y)
            //let lowestPoint = min(topLeft.vertex.y, topRight.vertex.y, bottomLeft.vertex.y, bottomRight.vertex.y)
            let farthestPoint = max(topLeftCorner.vertex.x, topRightCorner.vertex.x, bottomLeftCorner.vertex.x, bottomRightCorner.vertex.x)
            //let closestPoint = min(topLeft.vertex.x, topRight.vertex.x, bottomLeft.vertex.x, bottomRight.vertex.x)
            
            // correct origin if tetragon should always fit the frame
            let origin = CGPoint(x: 0, y: 0)
            let size = CGSize(width: farthestPoint, height: highestPoint)
            
            return CGRect(origin: origin, size: size)
        }
    }
    
    public var size : CGSize {
        get {
            return frame.size
        }
    }
    
    public var origin : CGPoint {
        get {
            return frame.origin
        }
    }
    
    public init(bottomLeft bottomLeft_I: CGPoint,topLeft topLeft_I: CGPoint, topRight topRight_I: CGPoint, bottomRight bottomRight_I: CGPoint) {
        bottomLeftCorner = TGCorner(vertex: bottomLeft_I, ray1: topLeft_I, ray2: bottomRight_I)
        topLeftCorner = TGCorner(vertex: topLeft_I, ray1: topRight_I, ray2: bottomLeft_I)
        topRightCorner = TGCorner(vertex: topRight_I, ray1: bottomRight_I, ray2: topLeft_I)
        bottomRightCorner = TGCorner(vertex: bottomRight_I, ray1: bottomLeft_I, ray2: topRight_I)
    }
    
    // short inits
    
    public init(squareWithSize size: CGFloat) {
        
        let bottomLeft_I = CGPointZero
        let topLeft_I = CGPoint(x: 0, y: size)
        let topRight_I = CGPoint(x: size, y: size)
        let bottomRight_I = CGPoint(x: size, y: 0)
        
        bottomLeftCorner = TGCorner(vertex: bottomLeft_I, ray1: topLeft_I, ray2: bottomRight_I)
        topLeftCorner = TGCorner(vertex: topLeft_I, ray1: topRight_I, ray2: bottomLeft_I)
        topRightCorner = TGCorner(vertex: topRight_I, ray1: bottomRight_I, ray2: topLeft_I)
        bottomRightCorner = TGCorner(vertex: bottomRight_I, ray1: bottomLeft_I, ray2: topRight_I)
        
    }
    
    public init(oblongWithSize size: CGSize) {
        
        let bottomLeft_I = CGPointZero
        let topLeft_I = CGPoint(x: 0, y: size.height)
        let topRight_I = CGPoint(x: size.width, y: size.height)
        let bottomRight_I = CGPoint(x: size.width, y: 0)
        
        bottomLeftCorner = TGCorner(vertex: bottomLeft_I, ray1: topLeft_I, ray2: bottomRight_I)
        topLeftCorner = TGCorner(vertex: topLeft_I, ray1: topRight_I, ray2: bottomLeft_I)
        topRightCorner = TGCorner(vertex: topRight_I, ray1: bottomRight_I, ray2: topLeft_I)
        bottomRightCorner = TGCorner(vertex: bottomRight_I, ray1: bottomLeft_I, ray2: topRight_I)
        
    }
    
}