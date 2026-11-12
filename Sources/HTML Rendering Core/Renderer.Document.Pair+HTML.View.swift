public import Renderer
public import WHATWG_HTML_Shared

extension Renderer.Document.Pair: HTML.View where First: HTML.View, Second: HTML.View {}
