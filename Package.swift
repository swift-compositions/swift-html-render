// swift-tools-version: 6.4

import PackageDescription

extension String {
    static let htmlRenderingCore: Self = "HTML Rendering Core"
    static let htmlAttributesRendering: Self = "HTML Attributes Rendering"
    static let htmlElementsRendering: Self = "HTML Elements Rendering"
    static let htmlRendering: Self = "HTML Rendering"

    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var htmlRenderingCore: Self { .target(name: .htmlRenderingCore) }
    static var htmlAttributesRendering: Self { .target(name: .htmlAttributesRendering) }
    static var htmlElementsRendering: Self { .target(name: .htmlElementsRendering) }
    static var htmlRenderingCoreTestSupport: Self {
        .target(name: "HTML Rendering Core Test Support")
    }
}

extension Target.Dependency {
    static var renderingPrimitives: Self {
        .product(name: "Render", package: "swift-render")
    }
    static var ascii: Self {
        .product(name: "ASCII", package: "swift-ascii")
    }
    static var htmlStandard: Self {
        .product(name: "HTML Standard", package: "swift-html-standard")
    }
    static var htmlStandardAttributes: Self {
        .product(name: "HTML Standard Attributes", package: "swift-html-standard")
    }
    static var htmlStandardElements: Self {
        .product(name: "HTML Standard Elements", package: "swift-html-standard")
    }
    static var htmlStandardTestSupport: Self {
        .product(name: "HTML Standard Test Support", package: "swift-html-standard")
    }
    static var whatwgHTMLShared: Self {
        .product(name: "WHATWG HTML Shared", package: "swift-whatwg-html")
    }

    static var w3cCSSShared: Self {
        .product(name: "W3C CSS Shared", package: "swift-w3c-css")
    }
    static var dictionaryPrimitives: Self {
        .product(name: "Dictionary", package: "swift-dictionary")
    }
    static var sharedPrimitive: Self {
        .product(name: "Ownership Shared Primitive", package: "swift-ownership-shared")
    }
    static var hashIndexedPrimitive: Self {
        .product(name: "Hash Indexed Primitive", package: "swift-hash-table")
    }
    static var columnPrimitives: Self {
        .product(name: "Column", package: "swift-column")
    }
    static var hashPrimitives: Self {
        .product(name: "Hash", package: "swift-hash")
    }
    static var bufferLinearPrimitive: Self {
        .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear")
    }
    static var ownershipMutablePrimitives: Self {
        .product(name: "Ownership", package: "swift-ownership")
    }
    static var asyncChannelPrimitives: Self {
        .product(name: "Async Channel", package: "swift-async-channel")
    }
    static var asyncPrimitive: Self {
        .product(name: "Async Primitive", package: "swift-async")
    }
}

let package = Package(
    name: "swift-html-render",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: .htmlRenderingCore, targets: [.htmlRenderingCore]),
        .library(name: .htmlAttributesRendering, targets: [.htmlAttributesRendering]),
        .library(name: .htmlElementsRendering, targets: [.htmlElementsRendering]),
        .library(name: .htmlRendering, targets: [.htmlRendering]),
        .library(
            name: "HTML Rendering Core Test Support",
            targets: ["HTML Rendering Core Test Support"]
        ),

    ],
    dependencies: [
        .package(url: "https://github.com/swift-molecules/swift-async-channel.git", branch: "main"),
        .package(
            url: "https://github.com/swift-molecules/swift-render.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-atoms/swift-ascii.git", branch: "main"),
        .package(url: "https://github.com/swift-standards/swift-html-standard.git", branch: "main"),
        .package(url: "https://github.com/swift-whatwg/swift-whatwg-html.git", branch: "main"),
        .package(url: "https://github.com/swift-w3c/swift-w3c-css.git", branch: "main"),

        .package(
            url: "https://github.com/swift-molecules/swift-dictionary.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dictionary-ordered.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ownership-shared.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash-table.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-column.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-buffer-linear.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ownership.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-async.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: .htmlRenderingCore,
            dependencies: [
                .renderingPrimitives,
                .ascii,
                .w3cCSSShared,
                .htmlStandard,
                .dictionaryPrimitives,
                .product(
                    name: "Dictionary Ordered",
                    package: "swift-dictionary-ordered"
                ),
                .sharedPrimitive,
                .hashIndexedPrimitive,
                .columnPrimitives,
                .hashPrimitives,
                .bufferLinearPrimitive,
                .ownershipMutablePrimitives,
                .asyncChannelPrimitives,
                .asyncPrimitive,
            ]
        ),

        .target(
            name: .htmlAttributesRendering,
            dependencies: [
                .htmlStandard,
                .htmlRenderingCore,
                .htmlStandardAttributes,
            ]
        ),

        .target(
            name: .htmlElementsRendering,
            dependencies: [
                .htmlStandard,
                .htmlAttributesRendering,
                .htmlStandardElements,
            ]
        ),

        .target(
            name: .htmlRendering,
            dependencies: [
                .htmlStandard,
                .htmlAttributesRendering,
                .htmlElementsRendering,
            ]
        ),

        .target(
            name: "HTML Rendering Core Test Support",
            dependencies: [
                .htmlRenderingCore,
                .w3cCSSShared,
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: .htmlRenderingCore.tests,
            dependencies: [
                .htmlRenderingCore,
                .target(name: .htmlRendering),
                .target(name: "HTML Rendering Core Test Support"),
            ],
            path: "Tests/HTML Rendering Core Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
