public import Renderer
public import Renderer_Document
public import WHATWG_HTML_Shared

extension HTML {
    public protocol View: Renderer.Document.View where Body: HTML.View {
        @HTML.Builder var body: Body { get }
    }
}

extension HTML.View where Body == Never {

    static var unrendered: Never {
        // swift-linter:disable:next fatal error outside tests
        // REASON: The only statement of a property of type Never, which the rule exempts since swift-institute/Issues#271; the linter CI runs predates that.
        fatalError("Body is Never and must not be accessed.")
    }
}

extension HTML.View {

    public func attribute(_ name: String, _ value: String? = "") -> HTML._Attributes<Self> {
        var attributes = HTML.Context.Attributes()
        if let value {
            attributes[name] = value
        }
        return HTML._Attributes(content: self, attributes: attributes)
    }
}

extension CustomStringConvertible where Self: HTML.View {
    public var description: String {
        do throws(HTML.Context.Configuration.Error) {
            return try String(self)
        } catch {
            return ""
        }
    }
}
