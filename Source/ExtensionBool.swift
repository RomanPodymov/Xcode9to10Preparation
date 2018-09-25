//
//  ExtensionBool.swift
//  Pods
//
//  Created by Roman Podymov on 21.06.18.
//

#if XCODE_9_ENVIRONMENT
public extension Bool {
    public mutating func toggle() {
        self = !self
    }
}
#else
#endif
