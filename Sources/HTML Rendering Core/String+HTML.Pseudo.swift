public import WHATWG_HTML_Shared

extension String {
    public init(_ pseudo: HTML.Pseudo) {
        self = pseudo.rawValue
    }
}
