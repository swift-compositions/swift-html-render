import ASCII
public import Buffer
public import Buffer_Linear_Primitive
public import Byte
import Dictionary
public import Dictionary_Ordered
public import Hash_Indexed_Primitive
public import Hash_Table_Primitive
public import Memory
public import Memory_Allocator
public import Ownership_Shared_Primitive
public import Renderer
public import Storage
public import WHATWG_HTML_Shared

extension HTML {

    public struct Context: Sendable {

        public var bytes: ContiguousArray<Byte>

        public var attributes: Attributes

        public var styles: Styles

        public let configuration: Configuration

        public var currentIndentation: [Byte]

        private var styleCounter: Int

        var stateStack: [SavedState]
    }
}

extension HTML.Context {

    struct SavedState {
        let tag: String
        let isVoid: Bool
        let isBlock: Bool
        let isPreElement: Bool
        let savedAttributes: HTML.Context.Attributes
        let savedIndentation: [Byte]
    }
}

extension HTML.Context {

    public init(_ configuration: Configuration = .current) {
        self.bytes = ContiguousArray<Byte>()
        self.attributes = Self.Attributes()
        self.styles = Self.Styles()
        self.configuration = configuration
        self.currentIndentation = []
        self.styleCounter = 0
        self.stateStack = []
        self.bytes.reserveCapacity(configuration.reservedCapacity)
    }
}

extension HTML.Context {
    public mutating func text(_ content: borrowing String) {
        write(escaping: copy content, quotes: false)
    }

    public static func _pushBlock(
        _ context: inout Self,
        role: Renderer.Document.Semantic.Block?,
        style: Renderer.Document.Style
    ) {
        let tag = tagName(forBlock: role)
        let isVoid = isVoidTag(tag)
        let isPreElement = tag == "pre"
        let isPrettyPrinting = !context.configuration.newline.isEmpty

        if isPrettyPrinting {
            if !context.bytes.isEmpty {
                context.bytes.append(contentsOf: context.configuration.newline)
            }
            context.bytes.append(contentsOf: context.currentIndentation)
        }

        context.writeOpeningTag(tag)

        if isVoid {
            context.attributes.removeAll()
            return
        }

        let savedAttributes = context.attributes
        let savedIndentation = context.currentIndentation
        context.attributes.removeAll()

        if isPrettyPrinting && !isPreElement {
            context.currentIndentation += context.configuration.indentation
        }

        context.stateStack.append(
            SavedState(
                tag: tag,
                isVoid: false,
                isBlock: true,
                isPreElement: isPreElement,
                savedAttributes: savedAttributes,
                savedIndentation: savedIndentation
            )
        )
    }

    public static func _popBlock(_ context: inout Self) {
        guard let state = context.stateStack.popLast() else { return }
        let isPrettyPrinting = !context.configuration.newline.isEmpty

        context.attributes = state.savedAttributes
        context.currentIndentation = state.savedIndentation

        if isPrettyPrinting && !state.isPreElement {
            context.bytes.append(contentsOf: context.configuration.newline)
            context.bytes.append(contentsOf: context.currentIndentation)
        }
        context.writeClosingTag(state.tag)
    }

    public static func _pushInline(
        _ context: inout Self,
        role: Renderer.Document.Semantic.Inline?,
        style: Renderer.Document.Style
    ) {
        let tag = tagName(forInline: role)

        context.writeOpeningTag(tag)

        let savedAttributes = context.attributes
        let savedIndentation = context.currentIndentation
        context.attributes.removeAll()

        context.stateStack.append(
            SavedState(
                tag: tag,
                isVoid: false,
                isBlock: false,
                isPreElement: false,
                savedAttributes: savedAttributes,
                savedIndentation: savedIndentation
            )
        )
    }

    public static func _popInline(_ context: inout Self) {
        guard let state = context.stateStack.popLast() else { return }
        context.attributes = state.savedAttributes
        context.currentIndentation = state.savedIndentation
        context.writeClosingTag(state.tag)
    }

    public static func _pushList(_ context: inout Self, kind: Renderer.Document.Semantic.List, start: Int?) {
        let tag = kind == .ordered ? "ol" : "ul"
        let isPrettyPrinting = !context.configuration.newline.isEmpty

        if isPrettyPrinting {
            if !context.bytes.isEmpty {
                context.bytes.append(contentsOf: context.configuration.newline)
            }
            context.bytes.append(contentsOf: context.currentIndentation)
        }

        context.writeOpeningTag(tag)

        let savedAttributes = context.attributes
        let savedIndentation = context.currentIndentation
        context.attributes.removeAll()

        if isPrettyPrinting {
            context.currentIndentation += context.configuration.indentation
        }

        context.stateStack.append(
            SavedState(
                tag: tag,
                isVoid: false,
                isBlock: true,
                isPreElement: false,
                savedAttributes: savedAttributes,
                savedIndentation: savedIndentation
            )
        )
    }

    public static func _popList(_ context: inout Self) {
        _popBlock(&context)
    }

    public static func _pushItem(_ context: inout Self) {
        let isPrettyPrinting = !context.configuration.newline.isEmpty

        if isPrettyPrinting {
            if !context.bytes.isEmpty {
                context.bytes.append(contentsOf: context.configuration.newline)
            }
            context.bytes.append(contentsOf: context.currentIndentation)
        }

        context.writeOpeningTag("li")

        let savedAttributes = context.attributes
        let savedIndentation = context.currentIndentation
        context.attributes.removeAll()

        if isPrettyPrinting {
            context.currentIndentation += context.configuration.indentation
        }

        context.stateStack.append(
            SavedState(
                tag: "li",
                isVoid: false,
                isBlock: true,
                isPreElement: false,
                savedAttributes: savedAttributes,
                savedIndentation: savedIndentation
            )
        )
    }

    public static func _popItem(_ context: inout Self) {
        _popBlock(&context)
    }

    public mutating func lineBreak() {
        let isPrettyPrinting = !configuration.newline.isEmpty
        if isPrettyPrinting {
            if !bytes.isEmpty {
                bytes.append(contentsOf: configuration.newline)
            }
            bytes.append(contentsOf: currentIndentation)
        }
        write(utf8: "<br>")
    }

    public mutating func thematicBreak() {
        let isPrettyPrinting = !configuration.newline.isEmpty
        if isPrettyPrinting {
            if !bytes.isEmpty {
                bytes.append(contentsOf: configuration.newline)
            }
            bytes.append(contentsOf: currentIndentation)
        }
        write(utf8: "<hr>")
    }

    public mutating func image(source: String, alt: String) {
        let isPrettyPrinting = !configuration.newline.isEmpty
        if isPrettyPrinting {
            if !bytes.isEmpty {
                bytes.append(contentsOf: configuration.newline)
            }
            bytes.append(contentsOf: currentIndentation)
        }
        write(utf8: "<img src=\"")
        escapeAttributeValue(source)
        write(utf8: "\" alt=\"")
        escapeAttributeValue(alt)
        write(utf8: "\">")
    }

    public static func _pushLink(_ context: inout Self, destination: borrowing String) {
        let copy = copy destination
        context.write(utf8: "<a href=\"")
        context.escapeAttributeValue(copy)
        context.write(utf8: "\">")

        let savedAttributes = context.attributes
        let savedIndentation = context.currentIndentation
        context.attributes.removeAll()

        context.stateStack.append(
            SavedState(
                tag: "a",
                isVoid: false,
                isBlock: false,
                isPreElement: false,
                savedAttributes: savedAttributes,
                savedIndentation: savedIndentation
            )
        )
    }

    public static func _popLink(_ context: inout Self) {
        guard let state = context.stateStack.popLast() else { return }
        context.attributes = state.savedAttributes
        context.currentIndentation = state.savedIndentation
        context.writeClosingTag("a")
    }

    public mutating func pageBreak() {
        let isPrettyPrinting = !configuration.newline.isEmpty
        if isPrettyPrinting {
            if !bytes.isEmpty {
                bytes.append(contentsOf: configuration.newline)
            }
            bytes.append(contentsOf: currentIndentation)
        }
        write(utf8: "<div style=\"page-break-after:always\"></div>")
    }
}

extension HTML.Context {

    mutating func writeOpeningTag(_ tag: String) {
        bytes.append(.ascii.lessThanSign)
        write(utf8: tag)

        let currentAttributes = attributes
        currentAttributes.forEach { name, value in
            bytes.append(.ascii.space)
            write(utf8: name)
            if !value.isEmpty {
                bytes.append(.ascii.equalsSign)
                bytes.append(.ascii.dquote)
                escapeAttributeValue(value)
                bytes.append(.ascii.dquote)
            }
        }
        bytes.append(.ascii.greaterThanSign)
    }

    mutating func writeClosingTag(_ tag: String) {
        bytes.append(.ascii.lessThanSign)
        bytes.append(.ascii.slant)
        write(utf8: tag)
        bytes.append(.ascii.greaterThanSign)
    }

    mutating func escapeAttributeValue(_ value: String) {
        write(escaping: value, quotes: true)
    }
}

extension HTML.Context {

    /// Appends a string's UTF-8 in one copy.
    mutating func write(utf8 string: String) {
        var string = string
        string.withUTF8 { utf8 in
            unsafe write(utf8: utf8)
        }
    }

    /// Appends UTF-8 in one copy. `Byte` is a frozen wrapper of a single `UInt8`, so the two share a layout.
    private mutating func write(utf8: UnsafeBufferPointer<UInt8>) {
        guard !utf8.isEmpty else { return }
        unsafe utf8.withMemoryRebound(to: Byte.self) { rebound in
            unsafe bytes.append(contentsOf: rebound)
        }
    }

    /// Appends a string's UTF-8 with `&`, `<` and `>` replaced by their entities, and `"` and `'` too when
    /// `quotes` is set. The stretches between two replaced bytes are each appended in one copy.
    private mutating func write(escaping string: String, quotes: Bool) {
        var string = string
        string.withUTF8 { utf8 in
            let raw = UnsafeRawBufferPointer(utf8)
            let count = utf8.count
            var written = 0
            var index = 0
            while index < count {
                let entity: [Byte]
                switch unsafe raw[index] {
                case 0x26: entity = .html.ampersand
                case 0x3C: entity = .html.lessThan
                case 0x3E: entity = .html.greaterThan
                case 0x22 where quotes: entity = .html.doubleQuotationMark
                case 0x27 where quotes: entity = .html.apostrophe
                default:
                    index += 1
                    continue
                }
                unsafe write(utf8: UnsafeBufferPointer(rebasing: utf8[written..<index]))
                bytes.append(contentsOf: entity)
                index += 1
                written = index
            }
            unsafe write(utf8: UnsafeBufferPointer(rebasing: utf8[written..<count]))
        }
    }
}

extension HTML.Context {

    static func tagName(forBlock role: Renderer.Document.Semantic.Block?) -> String {
        switch role {
        case .heading(let level): "h\(level)"
        case .paragraph: "p"
        case .blockquote: "blockquote"
        case .section: "section"
        case .pre: "pre"
        case .table: "table"
        case .row: "tr"
        case .cell(header: true): "th"
        case .cell(header: false): "td"
        case nil: "div"
        }
    }

    static func tagName(forInline role: Renderer.Document.Semantic.Inline?) -> String {
        switch role {
        case .emphasis: "em"
        case .strong: "strong"
        case .code: "code"
        case nil: "span"
        }
    }

    static func isVoidTag(_ tag: String) -> Bool {
        switch tag {
        case "area", "base", "br", "col", "embed", "hr", "img",
            "input", "link", "meta", "param", "source", "track", "wbr":
            true

        default:
            false
        }
    }
}

extension HTML.Context {
    public mutating func set(attribute name: String, _ value: String?) {
        if let value {
            attributes[name] = value
        }
    }

    public mutating func add(`class` name: String) {
        if let existing = attributes["class"] {
            attributes["class"] = existing + " " + name
        } else {
            attributes["class"] = name
        }
    }

    public static func _pushAttributes(_ context: inout Self) {
        context.stateStack.append(
            SavedState(
                tag: "",
                isVoid: false,
                isBlock: false,
                isPreElement: false,
                savedAttributes: context.attributes,
                savedIndentation: context.currentIndentation
            )
        )
    }

    public static func _popAttributes(_ context: inout Self) {
        guard let state = context.stateStack.popLast() else { return }
        context.attributes = state.savedAttributes
    }

    public mutating func write(raw bytes: [Byte]) {
        self.bytes.append(contentsOf: bytes)
    }

    public static func _pushElement(
        _ context: inout Self,
        tagName: String,
        isBlock: Bool,
        isVoid: Bool,
        isPreElement: Bool
    ) {
        let isPrettyPrinting = !context.configuration.newline.isEmpty
        let htmlIsBlock = isPrettyPrinting && isBlock

        if htmlIsBlock {
            if !context.bytes.isEmpty {
                context.bytes.append(contentsOf: context.configuration.newline)
            }
            context.bytes.append(contentsOf: context.currentIndentation)
        }

        context.writeOpeningTag(tagName)

        let savedAttributes = context.attributes
        let savedIndentation = context.currentIndentation
        context.attributes.removeAll()

        if isVoid {

            context.stateStack.append(
                SavedState(
                    tag: tagName,
                    isVoid: true,
                    isBlock: isBlock,
                    isPreElement: isPreElement,
                    savedAttributes: savedAttributes,
                    savedIndentation: savedIndentation
                )
            )
            return
        }

        if htmlIsBlock && !isPreElement {
            context.currentIndentation += context.configuration.indentation
        }

        context.stateStack.append(
            SavedState(
                tag: tagName,
                isVoid: false,
                isBlock: isBlock,
                isPreElement: isPreElement,
                savedAttributes: savedAttributes,
                savedIndentation: savedIndentation
            )
        )
    }

    public static func _popElement(_ context: inout Self, isBlock: Bool) {
        guard let state = context.stateStack.popLast() else { return }

        context.attributes = state.savedAttributes
        context.currentIndentation = state.savedIndentation

        if state.isVoid { return }

        let isPrettyPrinting = !context.configuration.newline.isEmpty
        if isPrettyPrinting && state.isBlock && !state.isPreElement {
            context.bytes.append(contentsOf: context.configuration.newline)
            context.bytes.append(contentsOf: context.currentIndentation)
        }
        context.writeClosingTag(state.tag)
    }

    public mutating func register(
        style declaration: String,
        atRule: String?,
        selector: String?,
        pseudo: String?
    ) -> String? {
        let style = HTML.Style.Rule(
            declaration: declaration,
            atRule: atRule.map { HTML.AtRule(rawValue: $0) },
            selector: selector.map { HTML.Selector(rawValue: $0) },
            pseudo: pseudo.map { HTML.Pseudo(rawValue: $0) }
        )
        return pushStyle(style)
    }
}

extension HTML.Context {

    public mutating func pushStyle(
        _ style: HTML.Style.Rule
    ) -> String {
        if let existing = styles[style] {
            return existing
        }
        let className = "\(style.propertyName)-\(styleCounter)"
        styleCounter += 1
        styles[style] = className
        return className
    }
}

extension HTML.Context {

    public func stylesheetBytes(baseIndentation: [Byte] = []) -> ContiguousArray<Byte> {

        var grouped: [HTML.AtRule?: [(style: HTML.Style.Rule, className: String)]] = [:]
        var groupOrder: [HTML.AtRule?] = []
        styles.forEach { style, className in
            if grouped[style.atRule] == nil {
                groupOrder.append(style.atRule)
            }
            grouped[style.atRule, default: []].append((style, className))
        }

        var sheet = ContiguousArray<Byte>()
        let sortedGroups =
            groupOrder
            .compactMap { key in grouped[key].map { (key: key, value: $0) } }
            .sorted(by: { $0.key == nil ? $1.key != nil : false })

        for (atRule, stylesForAtRule) in sortedGroups {
            if let atRule {
                sheet.append(contentsOf: configuration.newline)
                sheet.append(contentsOf: baseIndentation)
                sheet.append(contentsOf: atRule.rawValue.utf8.lazy.map(Byte.init(bitPattern:)))
                sheet.append(.ascii.leftBrace)
            }

            for (style, className) in stylesForAtRule {
                var selector = ""
                if let pre = style.selector?.rawValue {
                    selector.append(pre)
                    selector.append(" ")
                }
                selector.append(".")
                selector.append(className)
                if let pseudo = style.pseudo?.rawValue {
                    selector.append(pseudo)
                }

                sheet.append(contentsOf: configuration.newline)
                sheet.append(contentsOf: baseIndentation)
                if atRule != nil {
                    sheet.append(contentsOf: configuration.indentation)
                }
                sheet.append(contentsOf: selector.utf8.lazy.map(Byte.init(bitPattern:)))
                sheet.append(.ascii.leftBrace)
                sheet.append(contentsOf: style.declaration.utf8.lazy.map(Byte.init(bitPattern:)))
                if configuration.forceImportant {
                    sheet.append(
                        contentsOf: [.ascii.space] + .html.important
                    )
                }
                sheet.append(.ascii.rightBrace)
            }

            if atRule != nil {
                sheet.append(contentsOf: configuration.newline)
                sheet.append(contentsOf: baseIndentation)
                sheet.append(.ascii.rightBrace)
            }
        }
        return sheet
    }

    public var stylesheetBytes: ContiguousArray<Byte> {
        stylesheetBytes(baseIndentation: [])
    }

    public var stylesheet: String {
        String(decoding: stylesheetBytes, as: UTF8.self)
    }
}

extension HTML {
    static let important: [Byte] = [
        .ascii.exclamationPoint,
        .ascii.i,
        .ascii.m,
        .ascii.p,
        .ascii.o,
        .ascii.r,
        .ascii.t,
        .ascii.a,
        .ascii.n,
        .ascii.t,
    ]
}

extension HTML.Context {

    public typealias Styles = __DictionaryOrdered<
        Ownership.Shared<
            Hash.Entry<HTML.Style.Rule, String>,
            Hash.Indexed<Buffer<Storage<Memory.Allocator<Memory.Heap>>.Contiguous<Hash.Entry<HTML.Style.Rule, String>>>.Linear>
        >
    >
}
