import HTML_Rendering
import HTML_Standard
import Optic
import Renderer
import Testing
import WHATWG_DOM

@_spi(DynamicHTML) @testable import HTML_Rendering_Core

enum `HTML.Listening Tests` {}

extension `HTML.Listening Tests` {
    @Suite
    struct `Listeners and bindings add nothing to the server rendering` {}
}

extension `HTML.Listening Tests`.`Listeners and bindings add nothing to the server rendering` {

    @Test
    func `on renders nothing on the server`() throws {
        let view = tag("button") { HTML.Text("Increment") }.on(.click) {}
        #expect(try String(view) == "<button>Increment</button>")
    }

    @Test
    func `on keeps attributes set around it`() throws {
        let view = tag("button") { HTML.Text("Go") }.on(.click) {}.attribute("id", "go")
        #expect(try String(view) == #"<button id="go">Go</button>"#)
    }

    @Test
    func `value renders the binding's current value`() throws {
        let lens = Optic<Void, Void, String, String>.Lens(get: { _ in "Ada" }, set: { _, _ in })
        #expect(try String(tag("input").value(lens)) == #"<input value="Ada">"#)
    }

    @Test
    func `checked renders the attribute only when true`() throws {
        let on = Optic<Void, Void, Bool, Bool>.Lens(get: { _ in true }, set: { _, _ in })
        let off = Optic<Void, Void, Bool, Bool>.Lens(get: { _ in false }, set: { _, _ in })
        #expect(try String(tag("input").checked(on)) == "<input checked>")
        #expect(try String(tag("input").checked(off)) == "<input>")
    }

    @Test
    func `pressed renders aria-pressed`() throws {
        #expect(try String(tag("button").pressed(true)) == #"<button aria-pressed="true"></button>"#)
        #expect(try String(tag("button").pressed(false)) == #"<button aria-pressed="false"></button>"#)
    }

    @Test
    func `pressed renders the mixed state of a tri-state toggle`() throws {
        #expect(try String(tag("button").pressed(.mixed)) == #"<button aria-pressed="mixed"></button>"#)
    }

    @Test
    func `ForEach renders each row in order`() throws {
        let view = tag("ul") {
            HTML.ForEach([3, 1, 2], id: { $0 }) { number in
                tag("li") { HTML.Text("\(number)") }
            }
        }
        #expect(try String(view) == "<ul><li>3</li><li>1</li><li>2</li></ul>")
    }
}

extension `HTML.Listening Tests` {
    @Suite
    struct `Listeners reach the renderer and write back` {}
}

extension `HTML.Listening Tests`.`Listeners reach the renderer and write back` {

    final class Log {
        var events: [String] = []
        var listeners: [Renderer.Document.Listener] = []
    }

    static func context(_ log: Log) -> Renderer.Document.Context {
        Renderer.Document.Context(
            text: { log.events.append("text \($0)") },
            break: .init(line: {}, thematic: {}, page: {}),
            image: { _, _ in },
            push: .init(
                block: { _, _ in },
                inline: { _, _ in },
                list: { _, _ in },
                item: {},
                link: { _ in },
                element: { name, _, _, _ in log.events.append("open \(name)") },
                identity: { log.events.append("row \($0.hash == Renderer.Document.Identity("b").hash ? "b" : "?")") }
            ),
            pop: .init(
                block: {},
                inline: {},
                list: {},
                item: {},
                link: {},
                element: { _ in log.events.append("close") },
                identity: { log.events.append("end row") }
            ),
            setAttribute: { name, value in log.events.append("attribute \(name)=\(value ?? "nil")") },
            listen: { listener in
                log.events.append("listen \(listener.name)")
                log.listeners.append(listener)
            }
        )
    }

    @Test
    func `on hands its action to the renderer as a listener`() {
        let log = Log()
        var context = Self.context(log)
        var count = 0
        context.render(tag("button") { HTML.Text("+") }.on(.click) { count += 1 })
        #expect(log.events == ["listen click", "open button", "text +", "close"])
        log.listeners.first?.handle(Renderer.Document.Event())
        #expect(count == 1)
    }

    @Test
    func `value writes the event's value back through the binding`() {
        let log = Log()
        var context = Self.context(log)
        var name = "Ada"
        context.render(tag("input").value(Optic<Void, Void, String, String>.Lens(get: { _ in name }, set: { _, new in name = new })))
        #expect(log.events == ["listen input", "attribute value=Ada", "open input", "close"])
        log.listeners.first?.handle(Renderer.Document.Event(value: "Grace"))
        #expect(name == "Grace")
    }

    @Test
    func `checked writes the event's checked state back through the binding`() {
        let log = Log()
        var context = Self.context(log)
        var done = false
        context.render(tag("input").checked(Optic<Void, Void, Bool, Bool>.Lens(get: { _ in done }, set: { _, new in done = new })))
        #expect(log.listeners.map(\.name) == ["change"])
        log.listeners.first?.handle(Renderer.Document.Event(checked: true))
        #expect(done)
    }

    @Test
    func `ForEach wraps each row in its identity`() {
        let log = Log()
        var context = Self.context(log)
        context.render(HTML.ForEach(["b"], id: { $0 }) { row in tag("li") { HTML.Text(row) } })
        #expect(log.events == ["row b", "open li", "text b", "close", "end row"])
    }
}
