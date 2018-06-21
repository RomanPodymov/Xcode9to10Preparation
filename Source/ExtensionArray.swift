//
//  ExtensionArray.swift
//  Pods
//
//  Created by Roman Podymov on 21.06.18.
//

extension Array {
    public func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        do {
            return try !self.contains {
                do {
                    return try !predicate($0)
                } catch {
                    throw error
                }
            }
        } catch {
            throw error
        }
    }

    public mutating func removeAll(where predicate: (Element) throws -> Bool) rethrows {
        do {
            let indexesToRemove = try self.enumerated().reduce([Int]()) {
                do {
                    if try predicate($1.element) {
                        return $0 + [$1.offset]
                    }
                } catch {
                    throw error
                }
                return $0
            }
            indexesToRemove.enumerated().forEach {
                let currentOffset = $0.offset
                self.remove(at: indexesToRemove[currentOffset] - currentOffset)
            }
        } catch {
            throw error
        }
    }
    
    public func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        do {
            return try self.enumerated().first(where: {
                do {
                    return try predicate($0.element)
                } catch {
                    throw error
                }
            })?.offset
        } catch {
            throw error
        }
    }
    
    public func lastIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        do {
            return try self.reversed().firstIndex(where: predicate)
        } catch {
            throw error
        }
    }
    
    func starts<PossiblePrefix>(with possiblePrefix: PossiblePrefix, by areEquivalent: (Element, PossiblePrefix.Element) throws -> Bool) rethrows -> Bool where PossiblePrefix : Sequence {
        return true
    }
}
