public import Renderer
public import WHATWG_HTML_Shared

extension Renderer.Document._Tuple: HTML.View where repeat each Content: HTML.View {}
