import HTML_Rendering
@_spi(DynamicHTML) import HTML_Rendering_Core
import HTML_Standard
import Testing

@Suite struct `Class Attribute Tests` {
    enum Name: String {
        case row
        case on
        case shell
    }

    enum State: String {
        case open
    }

    @Test func `typed names become the class attribute`() throws {
        let html = tag("div") { HTML.Text("x") }.class(Name.row, .on)
        #expect(try String(html) == #"<div class="row on">x</div>"#)
    }

    @Test func `a list of typed names chosen at run time becomes the class attribute`() throws {
        let chosen = true
        let html = tag("div") { HTML.Text("x") }.class(chosen ? [Name.row, .on] : [.row])
        #expect(try String(html) == #"<div class="row on">x</div>"#)
    }

    @Test func `names of two types join into one class attribute`() throws {
        let rendered = try String(tag("div") { HTML.Text("x") }.class(Name.shell).class(State.open))
        #expect(rendered.contains(#"class=""#))
        #expect(rendered.contains("shell") && rendered.contains("open"))
    }

    @Test func `a class set on a styled element keeps the generated class`() throws {
        let html = tag("div") { HTML.Text("x") }.class(Name.row).inlineStyle("color", "red")
        let rendered = try String(HTML.Document { html })
        #expect(rendered.contains("row"))
        #expect(rendered.contains("color-0"))
    }
}
