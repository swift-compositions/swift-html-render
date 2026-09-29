public import Renderer
public import WHATWG_HTML_Shared

extension Renderer.Document.Conditional: HTML.View where First: HTML.View, Second: HTML.View {}
