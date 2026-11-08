import ASCII
public import Byte
import Renderer
public import WHATWG_HTML_Shared

extension HTML.Context.Configuration {
    public struct Error: Swift.Error {

        public let message: String
    }
}
