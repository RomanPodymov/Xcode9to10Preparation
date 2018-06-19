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
}
