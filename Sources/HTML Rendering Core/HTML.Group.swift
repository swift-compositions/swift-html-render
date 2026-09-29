public import Renderer
public import WHATWG_HTML_Shared

extension HTML {
    public typealias Group = Renderer.Document.Group
}

extension Renderer.Document.Group: HTML.View where Content: HTML.View {}
