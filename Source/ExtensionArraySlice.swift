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
        return try Array<Element>(self).allSatisfy(predicate)
    }
    
    public mutating func removeAll(where predicate: (Element) throws -> Bool) rethrows {
        var arrayBasedOnSlice = Array<Element>(self)
        try arrayBasedOnSlice.removeAll(where: predicate)
        self = ArraySlice<Element>(arrayBasedOnSlice)
    }
    
    public func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        return try Array<Element>(self).firstIndex(where: predicate)
    }
    
    public func lastIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        return try Array<Element>(self).lastIndex(where: predicate)
    }
    
    public func starts<PossiblePrefix>(with possiblePrefix: PossiblePrefix, by areEquivalent: (Element, PossiblePrefix.Element) throws -> Bool) rethrows -> Bool where PossiblePrefix : Sequence {
        return try Array<Element>(self).starts(with: possiblePrefix, by: areEquivalent)
    }
}
#endif
