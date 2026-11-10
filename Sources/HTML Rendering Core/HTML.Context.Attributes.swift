public import WHATWG_HTML_Shared

extension HTML.Context {

    /// The attributes of one element, in the order they were first set.
    ///
    /// An element carries a handful of attributes, so a flat list with a linear search is cheaper than a hash
    /// table: nothing is hashed, a copy is one retain, and setting an attribute on a fresh list is one append.
    public struct Attributes: Sendable {

        var entries: [(name: String, value: String)]

        public init() {
            self.entries = []
        }
    }
}

extension HTML.Context.Attributes {

    public var isEmpty: Bool { entries.isEmpty }

    public var count: Int { entries.count }

    /// The value of the attribute called `name`. Setting a value keeps the attribute's place if it is already
    /// present and appends it otherwise; setting `nil` removes it.
    public subscript(name: String) -> String? {
        get {
            for entry in entries where entry.name == name {
                return entry.value
            }
            return nil
        }
        set {
            var index = 0
            while index < entries.count {
                if entries[index].name == name {
                    if let newValue {
                        entries[index].value = newValue
                    } else {
                        entries.remove(at: index)
                    }
                    return
                }
                index += 1
            }
            if let newValue {
                entries.append((name: name, value: newValue))
            }
        }
    }

    public mutating func removeAll(keepingCapacity: Bool = false) {
        entries.removeAll(keepingCapacity: keepingCapacity)
    }

    /// Calls `body` with each attribute's name and value, in the order they were first set.
    public func forEach<Failure: Swift.Error>(
        _ body: (_ name: String, _ value: String) throws(Failure) -> Void
    ) throws(Failure) {
        for entry in entries {
            try body(entry.name, entry.value)
        }
    }
}
