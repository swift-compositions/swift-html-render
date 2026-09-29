public import Renderer
public import WHATWG_HTML_Shared

extension Renderer.Document.Builder {

    public static func buildBlock() -> Renderer.Document.Empty {
        Renderer.Document.Empty()
    }
}

extension HTML {
    public typealias Builder = Renderer.Document.Builder
}
