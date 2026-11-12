public import WHATWG_HTML_Shared

extension String {
    public init(_ atRule: HTML.AtRule) {
        self = atRule.rawValue
    }
}
