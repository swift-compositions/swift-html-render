public import WHATWG_HTML_Shared

extension String {
    public init(_ selector: HTML.Selector) {
        self = selector.rawValue
    }
}
