import HTML_Attributes_Rendering
import HTML_Standard_Elements

extension HTML.Script.Element {
    /// A script element with its text.
    ///
    /// The text is written as it is, except that `<` is written as `\u003C` where it
    /// would open a comment or open or close a script element. That form reads the same
    /// in a JavaScript string and in JSON, so a data block stays valid.
    public struct Filled: HTML.View {
        @usableFromInline let element: HTML.Script.Element
        @usableFromInline let text: String

        @usableFromInline
        init(element: HTML.Script.Element, text: String) {
            self.element = element
            self.text = text
        }
    }

    public func callAsFunction(
        _ script: () -> String = { "" }
    ) -> Filled {
        Filled(element: self, text: script())
    }
}

extension HTML.Script.Element.Filled {
    @usableFromInline
    var escaped: String {
        var escaped = ""
        escaped.unicodeScalars.reserveCapacity(text.unicodeScalars.count)
        for index in text.unicodeScalars.indices {
            let scalar = text.unicodeScalars[index]
            if scalar == "<",
                text.unicodeScalars[index...].starts(with: "<!--".unicodeScalars)
                    || text.unicodeScalars[index...].starts(with: "<script".unicodeScalars)
                    || text.unicodeScalars[index...].starts(with: "</script".unicodeScalars)
            {
                escaped.unicodeScalars.append(contentsOf: #"\u003C"#.unicodeScalars)
            } else {
                escaped.unicodeScalars.append(scalar)
            }
        }
        return escaped
    }

    public var body: some HTML.View {
        HTML.Tag.Element(for: HTML.Script.Element.self) {
            if text.isEmpty { HTML.Empty() } else { HTML.Raw(escaped) }
        }
        .src(element.src)
        .`async`(element.`async`)
        .`defer`(element.`defer`)
        .type(element.type)
        .integrity(element.integrity)
        .referrerPolicy(element.referrerpolicy)
        .nomodule(element.nomodule)
        .fetchPriority(element.fetchpriority)
        .blocking(element.blocking)
        .crossorigin(element.crossorigin)
        .nonce(element.nonce)
        .attributionSrc(element.attributionsrc)
    }
}

extension HTML.Script.Element: HTML.View, @retroactive Renderer.Document.View {
    public var body: some HTML.View {
        callAsFunction()
    }
}
