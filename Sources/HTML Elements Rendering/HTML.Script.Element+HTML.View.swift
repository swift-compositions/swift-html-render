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
    /// Whether the bytes from `index` on would open a comment or open or close a script
    /// element. A tag name matches in any letter case, as it does for an HTML parser.
    @usableFromInline
    static func isDangerous(_ bytes: UnsafeBufferPointer<UInt8>, at index: Int) -> Bool {
        var next = index + 1
        guard next < bytes.count else { return false }
        if bytes[next] == 0x21 {
            return next + 2 < bytes.count && bytes[next + 1] == 0x2D && bytes[next + 2] == 0x2D
        }
        if bytes[next] == 0x2F { next += 1 }
        guard next + 6 <= bytes.count else { return false }
        for (offset, letter) in "script".utf8.enumerated() where bytes[next + offset] | 0x20 != letter {
            return false
        }
        return true
    }

    @usableFromInline
    var escaped: String {
        var text = text
        return text.withUTF8 { bytes in
            var out: [UInt8] = []
            var copied = 0
            for index in bytes.indices where bytes[index] == 0x3C && Self.isDangerous(bytes, at: index) {
                out.append(contentsOf: bytes[copied..<index])
                out.append(contentsOf: #"\u003C"#.utf8)
                copied = index + 1
            }
            guard copied > 0 else { return String(decoding: bytes, as: UTF8.self) }
            out.append(contentsOf: bytes[copied...])
            return String(decoding: out, as: UTF8.self)
        }
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
