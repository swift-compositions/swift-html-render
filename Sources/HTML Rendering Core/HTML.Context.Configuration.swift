import ASCII
public import Byte
import Renderer
public import WHATWG_HTML_Shared

extension HTML.Context {

    public struct Configuration: Sendable {

        public let forceImportant: Bool

        public let indentation: [Byte]

        public let newline: [Byte]

        public let reservedCapacity: Int

        public init(
            forceImportant: Bool,
            indentation: [Byte],
            newline: [Byte],
            reservedCapacity: Int
        ) {
            self.forceImportant = forceImportant
            self.indentation = indentation
            self.newline = newline
            self.reservedCapacity = reservedCapacity
        }
    }
}

extension HTML.Context.Configuration {

    public static let `default` = Self(
        forceImportant: false,
        indentation: [],
        newline: [],
        reservedCapacity: 1024
    )

    public static let pretty = Self(
        forceImportant: false,
        indentation: [.ascii.space, .ascii.space],
        newline: [.ascii.lf],
        reservedCapacity: 2048
    )

    public static let email = Self(
        forceImportant: true,
        indentation: [.ascii.space],
        newline: [.ascii.lf],
        reservedCapacity: 2048
    )

    public static let optimized = Self(
        forceImportant: false,
        indentation: [],
        newline: [],
        reservedCapacity: 4096
    )
}

extension HTML.Context.Configuration {

    @TaskLocal public static var current: Self = .default
}

extension HTML.Context.Configuration {

    public struct Error: Swift.Error {

        public let message: String
    }
}
