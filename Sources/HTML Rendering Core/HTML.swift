public import Byte
public import WHATWG_HTML_Shared

extension HTML {

    public static let doubleQuotationMark: [Byte] = [
        .ascii.ampersand,
        .ascii.q,
        .ascii.u,
        .ascii.o,
        .ascii.t,
        .ascii.semicolon,
    ]

    public static let apostrophe: [Byte] = [
        .ascii.ampersand,
        .ascii.numberSign,
        .ascii.3,
        .ascii.9,
        .ascii.semicolon,
    ]

    public static let ampersand: [Byte] = [
        .ascii.ampersand,
        .ascii.a,
        .ascii.m,
        .ascii.p,
        .ascii.semicolon,
    ]

    public static let lessThan: [Byte] = [
        .ascii.ampersand,
        .ascii.l,
        .ascii.t,
        .ascii.semicolon,
    ]

    public static let greaterThan: [Byte] = [
        .ascii.ampersand,
        .ascii.g,
        .ascii.t,
        .ascii.semicolon,
    ]
}
