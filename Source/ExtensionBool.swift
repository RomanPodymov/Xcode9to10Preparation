//
//  ExtensionBool.swift
//  Pods
//
//  Created by Roman Podymov on 21.06.18.
//

#if XCODE_10_ENVIRONMENT
#else
public extension Bool {
    public mutating func toggle() {
        self = !self
    }
}
#endif
