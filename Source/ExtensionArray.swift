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
            }.lazy
            indexesToRemove.enumerated().forEach { currentIndexAndOffsetToRemove in
                let currentOffset = currentIndexAndOffsetToRemove.offset
                self.remove(at: indexesToRemove[currentOffset] - currentOffset)
            }
        } catch {
            throw error
        }
    }
}
