public import Render
public import WHATWG_HTML_Shared

extension HTML {

    public typealias Empty = Render.Empty
}

extension Render.Empty: HTML.View {}
