//
//  ExtensionBool.swift
//  Pods
//
//  Created by Roman Podymov on 21.06.18.
//

#if swift(>=3.4)
#else
public extension Bool {
    public mutating func toggle() {
        self = !self
    }
}
#endif
