import Byte
import HTML_Snapshot_Test_Support
import Testing

@testable import HTML_Rendering_Core

@Suite
struct `[Byte] Tests` {

    @Test
    func `[Byte] init from HTML`() throws {
        let html = tag("div") {
            HTML.Text("Hello")
        }
        let bytes = [Byte](html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<div>"))
        #expect(string.contains("Hello"))
        #expect(string.contains("</div>"))
    }

    @Test
    func `[Byte] init from empty HTML`() throws {
        let html = HTML.Empty()
        let bytes = [Byte](html)
        #expect(bytes.isEmpty)
    }

    @Test
    func `[Byte] init from complex HTML`() throws {
        let html = HTML.Group {
            tag("div") {
                tag("h1") {
                    HTML.Text("Title")
                }
                tag("p") {
                    HTML.Text("Content with & special < chars >")
                }
            }
        }
        let bytes = [Byte](html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("&amp;"))
        #expect(string.contains("&lt;"))
        #expect(string.contains("&gt;"))
    }

    @Test
    func `[Byte] async init from HTML`() async {
        let html = tag("span") {
            HTML.Text("Async content")
        }
        let bytes = await [Byte](html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<span>"))
        #expect(string.contains("Async content"))
    }

    @Test
    func `[Byte] async init with configuration`() async {
        let html = tag("div") {
            HTML.Text("Configured")
        }
        let bytes = await [Byte](html, configuration: .pretty)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<div>"))
    }

    @Test
    func `[Byte] async init from document`() async {
        let document = HTML.Document {
            tag("p") {
                HTML.Text("Document content")
            }
        }
        let bytes = await [Byte](document)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<!doctype html>"))
        #expect(string.contains("Document content"))
    }

    @Test
    func `[Byte] htmlEntityQuot`() {
        let entity = [Byte].html.doubleQuotationMark
        let string = String(decoding: entity, as: UTF8.self)
        #expect(string == "&quot;")
    }

    @Test
    func `[Byte] htmlEntityApos`() {
        let entity = [Byte].html.apostrophe
        let string = String(decoding: entity, as: UTF8.self)
        #expect(string == "&#39;")
    }

    @Test
    func `[Byte] htmlEntityAmp`() {
        let entity = [Byte].html.ampersand
        let string = String(decoding: entity, as: UTF8.self)
        #expect(string == "&amp;")
    }

    @Test
    func `[Byte] htmlEntityLt`() {
        let entity = [Byte].html.lessThan
        let string = String(decoding: entity, as: UTF8.self)
        #expect(string == "&lt;")
    }

    @Test
    func `[Byte] htmlEntityGt`() {
        let entity = [Byte].html.greaterThan
        let string = String(decoding: entity, as: UTF8.self)
        #expect(string == "&gt;")
    }

    @Test
    func `HTML asyncBytes method`() async {
        let html = tag("article") {
            HTML.Text("Async bytes content")
        }
        let bytes = await [Byte](html)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<article>"))
        #expect(string.contains("Async bytes content"))
    }

    @Test
    func `HTML asyncBytes with configuration`() async {
        let html = tag("section") {
            HTML.Text("Configured bytes")
        }
        let bytes = await [Byte](html, configuration: .pretty)
        let string = String(decoding: bytes, as: UTF8.self)
        #expect(string.contains("<section>"))
    }
}

extension `Snapshot Tests` {
    @Suite
    struct `Byte Array Snapshot Tests` {
        @Test
        func `[Byte] document rendering snapshot`() {
            snapshot(as: .html) {
                HTML.Document {
                    tag("main") {
                        tag("h1") {
                            HTML.Text("Byte Array Test")
                        }
                        tag("p") {
                            HTML.Text("Testing [Byte] rendering path")
                        }
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                  </head>
                  <body>
                    <main>
                      <h1>Byte Array Test
                      </h1>
                      <p>Testing [Byte] rendering path
                      </p>
                    </main>
                  </body>
                </html>
                """
            }
        }
    }
}
