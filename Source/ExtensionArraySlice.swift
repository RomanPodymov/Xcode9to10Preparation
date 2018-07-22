//
//  ExtensionArraySlice.swift
//  Pods
//
//  Created by Roman Podymov on 20.07.2018.
//

import Foundation

#if swift(>=4.2)
#else
public extension ArraySlice {
    public func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try !self.contains {
            return try !predicate($0)
        }
    }
}
#endif
