//
//  ExtensionArray.swift
//  Pods
//
//  Created by Roman Podymov on 21.06.18.
//

#if XCODE_9_ENVIRONMENT
public extension Array {
    public func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try !self.contains {
            return try !predicate($0)
        }
    }

    public mutating func removeAll(where predicate: (Element) throws -> Bool) rethrows {
        let indexesToRemove = try self.enumerated().reduce([Int]()) {
            if try predicate($1.element) {
                return $0 + [$1.offset]
            }
            return $0
        }
        indexesToRemove.enumerated().forEach {
            let currentOffset = $0.offset
            self.remove(at: indexesToRemove[currentOffset] - currentOffset)
        }
    }
    
    public func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        return try self.enumerated().first(where: {
            return try predicate($0.element)
        })?.offset
    }
    
    public func lastIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        guard let indexInReversedArray = try self.reversed().firstIndex(where: predicate) else {
            return nil
        }
        return self.count - indexInReversedArray - 1
    }
    
    public func starts<PossiblePrefix>(with possiblePrefix: PossiblePrefix, by areEquivalent: (Element, PossiblePrefix.Element) throws -> Bool) rethrows -> Bool where PossiblePrefix : Sequence {
        guard let possiblePrefixElementsCount = try? possiblePrefix.count() else {
            return false
        }
        if possiblePrefixElementsCount > self.count {
            return false
        }
        return try !zip(self, possiblePrefix).contains{ try !areEquivalent($0, $1) }
    }
}

fileprivate extension Sequence {
    private static func predicateTrue(element: Element) -> Bool {
        return true
    }

    private static func predicateFalse(element: Element) -> Bool {
        return !predicateTrue(element: element)
    }

    fileprivate func count(predicate: (Element) throws -> Bool = predicateTrue) rethrows -> Int {
        return try self.reduce(0) { currentResult, currentElement in
            return currentResult + (try predicate(currentElement) ? 1 : 0)
        }
    }
}
#else
#endif
