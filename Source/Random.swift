//
//  Random.swift
//  Pods
//
//  Created by Roman Podymov on 23.06.18.
//

import Darwin

#if swift(>=3.4)
#else
public protocol RandomNumberGenerator {
    mutating func next() -> UInt64

    mutating func next<T>(upperBound: T) -> T where T : FixedWidthInteger, T : UnsignedInteger
}

public struct Random: RandomNumberGenerator {
    static var `default`: Random = Random()
    
    private init() {
        
    }
    
    public mutating func next<T>() -> T where T : FixedWidthInteger, T : UnsignedInteger {
        return T(arc4random())
    }
    
    public mutating func next() -> UInt64 {
        return UInt64(arc4random())
    }
    
    public mutating func next<T>(upperBound: T) -> T where T : FixedWidthInteger, T : UnsignedInteger {
        return T(arc4random_uniform(UInt32(upperBound)))
    }
}
#endif
