public import Renderer
public import WHATWG_HTML_Shared

#if !hasFeature(Embedded)
    extension Renderer.Document._Tuple: HTML.View where repeat each Content: HTML.View {}
#endif
