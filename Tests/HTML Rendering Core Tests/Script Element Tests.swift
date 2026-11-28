import HTML_Rendering
@_spi(DynamicHTML) import HTML_Rendering_Core
import HTML_Standard
import Testing

@Suite struct `Script Element Tests` {
    @Test func `a script keeps its text and its attributes`() throws {
        let html = HTML.Script.Element(type: "module") { "let a = 1 < 2" }
        #expect(try String(html) == #"<script type="module">let a = 1 < 2</script>"#)
    }

    @Test func `text that would close the script is written in a form JSON also reads`() throws {
        let html = HTML.Script.Element(type: "application/ld+json") { #"{"name":"</script><!--"}"# }
        #expect(try String(html) == #"<script type="application/ld+json">{"name":"\u003C/script>\u003C!--"}</script>"#)
    }

    @Test func `scripts made in a loop are a view`() throws {
        let html = tag("head") {
            for text in ["a", "b"] {
                HTML.Script.Element() { text }
            }
        }
        #expect(try String(html) == "<head><script>a</script><script>b</script></head>")
    }

    @Test func `a closing tag in any letter case is written safely`() throws {
        let html = HTML.Script.Element() { "a</SCRIPT>b<Script>c</scripT d<b>" }
        let text = try String(html)
        #expect(!text.dropLast(9).lowercased().contains("</script"))
        #expect(text.hasSuffix("d<b></script>"))
        #expect(text.contains("a"+"\\u003C/SCRIPT>b"+"\\u003CScript>c"))
    }
}
