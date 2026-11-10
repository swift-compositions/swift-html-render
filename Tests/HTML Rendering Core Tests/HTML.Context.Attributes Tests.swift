import HTML_Rendering
import HTML_Standard
import Testing

@_spi(DynamicHTML) @testable import HTML_Rendering_Core

@Suite
struct `HTML.Context.Attributes Tests` {
    @Suite struct Unit {}
    @Suite struct Integration {}
}

extension `HTML.Context.Attributes Tests`.Unit {

    private func pairs(_ attributes: HTML.Context.Attributes) -> [String] {
        var pairs: [String] = []
        attributes.forEach { name, value in pairs.append("\(name)=\(value)") }
        return pairs
    }

    @Test
    func `a new list is empty`() {
        let attributes = HTML.Context.Attributes()

        #expect(attributes.isEmpty)
        #expect(attributes.count == 0)
        #expect(attributes["class"] == nil)
        #expect(pairs(attributes) == [])
    }

    @Test
    func `attributes come back in the order they were first set`() {
        var attributes = HTML.Context.Attributes()
        attributes["href"] = "/a"
        attributes["class"] = "row"
        attributes["id"] = "first"

        #expect(pairs(attributes) == ["href=/a", "class=row", "id=first"])
        #expect(attributes.count == 3)
        #expect(!attributes.isEmpty)
    }

    @Test
    func `a value is found by its name`() {
        var attributes = HTML.Context.Attributes()
        attributes["href"] = "/a"
        attributes["class"] = "row"

        #expect(attributes["href"] == "/a")
        #expect(attributes["class"] == "row")
        #expect(attributes["id"] == nil)
    }

    @Test
    func `setting a name again replaces its value and keeps its place`() {
        var attributes = HTML.Context.Attributes()
        attributes["href"] = "/a"
        attributes["class"] = "row"
        attributes["href"] = "/b"

        #expect(pairs(attributes) == ["href=/b", "class=row"])
        #expect(attributes.count == 2)
    }

    @Test
    func `setting nil removes the attribute and keeps the others in order`() {
        var attributes = HTML.Context.Attributes()
        attributes["href"] = "/a"
        attributes["class"] = "row"
        attributes["id"] = "first"
        attributes["class"] = nil

        #expect(pairs(attributes) == ["href=/a", "id=first"])
        #expect(attributes["class"] == nil)
    }

    @Test
    func `setting nil for a name that is absent changes nothing`() {
        var attributes = HTML.Context.Attributes()
        attributes["href"] = "/a"
        attributes["class"] = nil

        #expect(pairs(attributes) == ["href=/a"])
    }

    @Test
    func `removing all leaves an empty list`() {
        var attributes = HTML.Context.Attributes()
        attributes["href"] = "/a"
        attributes["class"] = "row"
        attributes.removeAll()

        #expect(attributes.isEmpty)
        #expect(pairs(attributes) == [])
    }

    @Test
    func `a copy does not change with the original`() {
        var original = HTML.Context.Attributes()
        original["href"] = "/a"
        let copy = original
        original["href"] = "/b"
        original["class"] = "row"

        #expect(pairs(copy) == ["href=/a"])
        #expect(pairs(original) == ["href=/b", "class=row"])
    }
}

extension `HTML.Context.Attributes Tests`.Integration {

    @Test
    func `an element writes its attributes in the order they were first set`() throws {
        let html = tag("a") { HTML.Text("x") }
            .attribute("href", "/a")
            .attribute("class", "row")
            .attribute("href", "/b")
            .attribute("hidden")

        #expect(try String(html) == "<a href=\"/b\" class=\"row\" hidden>x</a>")
    }

    @Test
    func `an attribute set to nil is not written`() throws {
        let html = tag("a") { HTML.Text("x") }
            .attribute("href", "/a")
            .attribute("class", "row")
            .attribute("href", nil)

        #expect(try String(html) == "<a class=\"row\">x</a>")
    }

    @Test
    func `a child does not inherit its parent's attributes`() throws {
        let html = tag("ul") {
            tag("li") { HTML.Text("x") }
            tag("li") { HTML.Text("y") }.attribute("class", "last")
        }
        .attribute("class", "list")

        #expect(try String(html).filter { !$0.isWhitespace } == "<ulclass=\"list\"><li>x</li><liclass=\"last\">y</li></ul>")
    }

    @Test
    func `text escapes ampersand and angle brackets and leaves quotes alone`() throws {
        let html = tag("b") { HTML.Text("a&b<c>d\"e'f") }

        #expect(try String(html) == "<b>a&amp;b&lt;c&gt;d\"e'f</b>")
    }

    @Test
    func `text made only of escaped bytes is written as entities`() throws {
        let html = tag("b") { HTML.Text("<&&>") }

        #expect(try String(html) == "<b>&lt;&amp;&amp;&gt;</b>")
    }

    @Test
    func `text keeps what stands before the first and after the last escaped byte`() throws {
        let html = tag("b") { HTML.Text("a long stretch of plain text < and another long stretch of plain text") }

        #expect(
            try String(html)
                == "<b>a long stretch of plain text &lt; and another long stretch of plain text</b>"
        )
    }

    @Test
    func `empty text writes nothing`() throws {
        let html = tag("b") { HTML.Text("") }

        #expect(try String(html) == "<b></b>")
    }

    @Test
    func `text beyond ASCII is written byte for byte`() throws {
        let html = tag("b") { HTML.Text("café <über> 法律 & 🇳🇱") }

        #expect(try String(html) == "<b>café &lt;über&gt; 法律 &amp; 🇳🇱</b>")
    }

    @Test
    func `an attribute value escapes quotes as well`() throws {
        let html = tag("b").attribute("title", "a&b<c>d\"e'f é")

        #expect(try String(html) == "<b title=\"a&amp;b&lt;c&gt;d&quot;e&#39;f é\"></b>")
    }

    @Test
    func `a long tag name and attribute name are written whole`() throws {
        let html = tag("a-custom-element-with-a-long-name").attribute("data-a-long-attribute-name", "v")

        #expect(
            try String(html)
                == "<a-custom-element-with-a-long-name data-a-long-attribute-name=\"v\"></a-custom-element-with-a-long-name>"
        )
    }
}
