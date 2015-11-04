//
//  TetragonExtension.swift
//  Tetragon
//
//  Created by Romain Menke on 27/10/15.
//
//

import UIKit


public struct TetragonGenerator: GeneratorType {
    
    let value: Tetragon
    var indexInSequence = 0
    
    init(value: Tetragon) {
        self.value = value
    }
    
    mutating public func next() -> CGPoint? {
        
        if indexInSequence < 4 {
            
        } else {
            indexInSequence = 0
            return nil
        }
        
        switch indexInSequence {
        case 0 :
            return value.bottomLeft
        case 1 :
            return value.topLeft
        case 2 :
            return value.topRight
        case 3 :
            return value.bottomRight
        default :
            return value.bottomLeft
        }
    }
}

extension Tetragon: SequenceType {
    public func generate() -> TetragonGenerator {
        return TetragonGenerator(value: self)
    }
}


func ==(lhs: Tetragon, rhs: Tetragon) -> Bool {
    return lhs.bottomLeft == rhs.bottomLeft && lhs.topLeft == rhs.topLeft && lhs.topRight == rhs.topRight && lhs.bottomRight == rhs.bottomRight
}

func !=(lhs: Tetragon, rhs: Tetragon) -> Bool {
    return !(lhs == rhs)
}

func >(lhs: Tetragon, rhs: Tetragon) -> Bool {
    return lhs.area > rhs.area
}

func <(lhs: Tetragon, rhs: Tetragon) -> Bool {
    return lhs.area < rhs.area
}