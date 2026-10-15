public import Byte
import Renderer
public import WHATWG_HTML_Shared

extension HTML {
    public static var tag: HTML.Tag.Type {
        HTML.Tag.self
    }
}

extension HTML {

    public struct Tag {

        public let rawValue: String

        internal init(_ rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension HTML.Tag {

    @inlinable
    public static var doctype: [Byte] {
        [
            .ascii.lessThanSign, .ascii.exclamationPoint,
            .ascii.d, .ascii.o, .ascii.c, .ascii.t, .ascii.y, .ascii.p, .ascii.e,
            .ascii.space,
            .ascii.h, .ascii.t, .ascii.m, .ascii.l,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var open: [Byte] {
        [
            .ascii.lessThanSign,
            .ascii.h, .ascii.t, .ascii.m, .ascii.l,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var close: [Byte] {
        [
            .ascii.lessThanSign, .ascii.slant,
            .ascii.h, .ascii.t, .ascii.m, .ascii.l,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var headOpen: [Byte] {
        [
            .ascii.lessThanSign,
            .ascii.h, .ascii.e, .ascii.a, .ascii.d,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var headClose: [Byte] {
        [
            .ascii.lessThanSign, .ascii.slant,
            .ascii.h, .ascii.e, .ascii.a, .ascii.d,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var bodyOpen: [Byte] {
        [
            .ascii.lessThanSign,
            .ascii.b, .ascii.o, .ascii.d, .ascii.y,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var bodyClose: [Byte] {
        [
            .ascii.lessThanSign, .ascii.slant,
            .ascii.b, .ascii.o, .ascii.d, .ascii.y,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var styleOpen: [Byte] {
        [
            .ascii.lessThanSign,
            .ascii.s, .ascii.t, .ascii.y, .ascii.l, .ascii.e,
            .ascii.greaterThanSign,
        ]
    }

    @inlinable
    public static var styleClose: [Byte] {
        [
            .ascii.lessThanSign, .ascii.slant,
            .ascii.s, .ascii.t, .ascii.y, .ascii.l, .ascii.e,
            .ascii.greaterThanSign,
        ]
    }
}
