public import Byte
import Renderer
public import WHATWG_HTML_Shared

extension Array where Element == Byte {
    public static var html: HTML.Type {
        HTML.self
    }
}

extension ContiguousArray where Element == Byte {
    public static var html: HTML.Type {
        HTML.self
    }
}
