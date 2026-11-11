public import Renderer
public import WHATWG_HTML_Shared

extension Renderer.Document.ForEach: HTML.View where Content: HTML.View {}
