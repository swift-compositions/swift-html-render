public import Renderer
public import WHATWG_HTML_Shared

extension HTML {

    public typealias Empty = Renderer.Document.Empty
}

extension Renderer.Document.Empty: HTML.View {}
