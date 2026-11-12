public import Optic
public import Renderer
public import WHATWG_DOM
public import WHATWG_HTML_Shared

extension HTML {

    public struct Listening<Content: HTML.View>: HTML.View {

        public let content: Renderer.Document.Indirect<Content>

        public let listener: Renderer.Document.Listener

        public init(content: Content, listener: Renderer.Document.Listener) {
            self.content = Renderer.Document.Indirect(content)
            self.listener = listener
        }
    }
}

extension HTML.Listening {

    public typealias Body = Never
    public var body: Never { Self.unrendered }


    public static func _render(
        _ view: borrowing Self,
        context: inout Renderer.Document.Context
    ) {
        context.open(push: .attributes, pop: .attributes)
        context.listen(view.listener)
        Content._render(view.content.value, context: &context)
    }
}

extension HTML.View {

    public func on(_ event: WHATWG.DOM.Event, _ action: @escaping () -> Void) -> HTML.Listening<Self> {
        HTML.Listening(content: self, listener: Renderer.Document.Listener(event.type) { _ in action() })
    }

    public func value(_ lens: Optic<Void, Void, String, String>.Lens) -> HTML.Listening<HTML._Attributes<Self>> {
        HTML.Listening(
            content: self.attribute("value", lens.get(())),
            listener: Renderer.Document.Listener(WHATWG.DOM.Event.input.type) { lens.set((), $0.value) }
        )
    }

    public func checked(_ lens: Optic<Void, Void, Bool, Bool>.Lens) -> HTML.Listening<HTML._Attributes<Self>> {
        HTML.Listening(
            content: self.attribute("checked", lens.get(()) ? "" : nil),
            listener: Renderer.Document.Listener(WHATWG.DOM.Event.change.type) { lens.set((), $0.checked) }
        )
    }

    // swift-linter:disable:next bool public parameter
    // REASON: aria-pressed is a two-state attribute, and .pressed(Bool) is the spelling the product owner chose.
    public func pressed(_ pressed: Bool) -> HTML._Attributes<Self> {
        self.attribute("aria-pressed", pressed ? "true" : "false")
    }
}
