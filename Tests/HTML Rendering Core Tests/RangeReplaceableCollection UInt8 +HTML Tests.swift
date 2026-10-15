import Byte
import HTML_Rendering
@_spi(DynamicHTML) import HTML_Rendering_Core
import HTML_Standard
import Testing

@Suite
struct `RangeReplaceableCollection Byte HTML Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `RangeReplaceableCollection Byte HTML Tests`.Unit {

    @Test
    func `Array Byte renders HTML view`() {
        let html = tag("div") { HTML.Text("hello") }
        let bytes: [Byte] = .init(html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<div>"))
        #expect(string.contains("hello"))
        #expect(string.contains("</div>"))
    }

    @Test
    func `ContiguousArray Byte renders HTML view`() {
        let html = tag("span") { HTML.Text("content") }
        let bytes: ContiguousArray<Byte> = .init(html)
        let string = String(decoding: Array(bytes), as: UTF8.self)
        #expect(string.contains("<span>"))
        #expect(string.contains("content"))
        #expect(string.contains("</span>"))
    }

    @Test
    func `renders with custom configuration`() {
        let html = tag("div") { HTML.Text("test") }
        let config = HTML.Context.Configuration(
            forceImportant: false,
            indentation: [],
            newline: [],
            reservedCapacity: 1024
        )
        let bytes: [Byte] = .init(html, configuration: config)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<div>"))
    }

    @Test
    func `async Array Byte renders HTML view`() async {
        let html = tag("article") { HTML.Text("async content") }
        let bytes: [Byte] = await .init(html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<article>"))
        #expect(string.contains("async content"))
    }

    @Test
    func `async ContiguousArray Byte renders HTML view`() async {
        let html = tag("section") { HTML.Text("async section") }
        let bytes: ContiguousArray<Byte> = await .init(html)
        let string = String(decoding: Array(bytes), as: UTF8.self)
        #expect(string.contains("<section>"))
    }

    @Test
    func `renders Group`() {
        let html = HTML.Group {
            tag("span") { HTML.Text("a") }
            tag("span") { HTML.Text("b") }
        }
        let bytes: [Byte] = .init(html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<span>a</span>"))
        #expect(string.contains("<span>b</span>"))
    }

    @Test
    func `renders array of views`() {
        let items = ["one", "two", "three"]
        let html = items.map { item in
            tag("li") { HTML.Text(item) }
        }
        let bytes: [Byte] = .init(html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<li>one</li>"))
        #expect(string.contains("<li>two</li>"))
        #expect(string.contains("<li>three</li>"))
    }

    @Test
    func `renders HTML.Raw`() {
        let html = HTML.Raw("<custom-element>raw</custom-element>")
        let bytes: [Byte] = .init(html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string == "<custom-element>raw</custom-element>")
    }
}

extension `RangeReplaceableCollection Byte HTML Tests`.`Edge Case` {

    @Test
    func `Array Byte renders empty HTML`() {
        let html = HTML.Empty()
        let bytes: [Byte] = .init(html)
        #expect(bytes.isEmpty)
    }

    @Test
    func `Array Byte renders nested HTML`() {
        let html = tag("div") {
            tag("p") {
                HTML.Text("nested")
            }
        }
        let bytes: [Byte] = .init(html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<div>"))
        #expect(string.contains("<p>"))
        #expect(string.contains("nested"))
    }
}

extension `RangeReplaceableCollection Byte HTML Tests`.Integration {

    @Test
    func `Array Byte renders HTML document`() {
        let document = HTML.Document {
            tag("h1") { HTML.Text("Title") }
        }
        let bytes: [Byte] = .init(document)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<!doctype html>"))
        #expect(string.contains("<html>"))
        #expect(string.contains("<h1>"))
        #expect(string.contains("Title"))
    }

    @Test
    func `async Array Byte renders HTML document`() async {
        let document = HTML.Document {
            tag("p") { HTML.Text("Async document") }
        }
        let bytes: [Byte] = await .init(document)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<!doctype html>"))
        #expect(string.contains("Async document"))
    }
}

extension `RangeReplaceableCollection Byte HTML Tests`.Integration {
    @Test
    func `raw rendering preserves every byte pattern`() {
        let input = (UInt8.min...UInt8.max).map(Byte.init(bitPattern:))
        let output = [Byte](HTML.Raw(input))
        #expect(output == input)
    }
}
