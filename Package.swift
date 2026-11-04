// swift-tools-version: 6.4

import PackageDescription

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
        .library(name: "HTML Rendering Core", targets: ["HTML Rendering Core"]),
        .library(name: "HTML Attributes Rendering", targets: ["HTML Attributes Rendering"]),
        .library(name: "HTML Elements Rendering", targets: ["HTML Elements Rendering"]),
        .library(name: "HTML Rendering", targets: ["HTML Rendering"]),
        .library(
            name: "HTML Rendering Core Test Support",
            targets: ["HTML Rendering Core Test Support"]
        ),

    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-byte.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-async-channel.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-renderer.git",
            branch: "main",
            traits: ["Document"]
        ),
        .package(url: "https://github.com/swift-atoms/swift-ascii.git", branch: "main", traits: ["Coder", "Parser", "Serializer"]),
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
            url: "https://github.com/swift-molecules/swift-buffer-linear.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ownership.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-async.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-atoms/swift-buffer.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-buffer-ring.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-memory.git", branch: "main", traits: ["Lock", "Map", "Shared", "Cursor"]),
        .package(url: "https://github.com/swift-molecules/swift-memory-allocation.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-storage.git", branch: "main", traits: ["Generational", "Memory"]),
        .package(url: "https://github.com/swift-atoms/swift-store.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-coder.git", branch: "main", traits: ["Carrier", "Map"]),
        .package(url: "https://github.com/swift-atoms/swift-ratio.git", branch: "main", traits: ["Bit", "Ordinal", "Difference"]),
        .package(url: "https://github.com/swift-atoms/swift-span.git", branch: "main", traits: ["Iterator"]),
        .package(url: "https://github.com/swift-atoms/swift-finite.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-affine.git", branch: "main", traits: ["Tagged", "Vector"]),
    ],
    targets: [

        .target(
            name: "HTML Rendering Core",
            dependencies: [
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Renderer", package: "swift-renderer"),
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .product(name: "Dictionary", package: "swift-dictionary"),
                .product(
                    name: "Dictionary Ordered",
                    package: "swift-dictionary-ordered"
                ),
                .product(name: "Ownership Shared Primitive", package: "swift-ownership-shared"),
                .product(name: "Hash Indexed Primitive", package: "swift-hash-table"),
                .product(name: "Hash Table Primitive", package: "swift-hash-table"),
                .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Async Channel", package: "swift-async-channel"),
                .product(name: "Async Primitive", package: "swift-async"),
                .product(name: "Buffer", package: "swift-buffer"),
                .product(name: "Buffer Linear Bounded Primitive", package: "swift-buffer-linear"),
                .product(name: "Buffer Ring Primitive", package: "swift-buffer-ring"),
                .product(name: "Memory Allocator Pool", package: "swift-memory-allocation"),
                .product(name: "Memory Pool", package: "swift-memory-allocation"),
                .product(name: "Memory Allocator", package: "swift-memory-allocation"),
                .product(name: "Memory", package: "swift-memory"),
                .product(name: "Storage", package: "swift-storage"),
                .product(name: "Store", package: "swift-store"),
            ]
        ),

        .target(
            name: "HTML Attributes Rendering",
            dependencies: [
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .target(name: "HTML Rendering Core"),
                .product(name: "HTML Standard Attributes", package: "swift-html-standard"),
            ]
        ),

        .target(
            name: "HTML Elements Rendering",
            dependencies: [
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .target(name: "HTML Attributes Rendering"),
                .product(name: "HTML Standard Elements", package: "swift-html-standard"),
            ]
        ),

        .target(
            name: "HTML Rendering",
            dependencies: [
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .target(name: "HTML Attributes Rendering"),
                .target(name: "HTML Elements Rendering"),
            ]
        ),

        .target(
            name: "HTML Rendering Core Test Support",
            dependencies: [
                .target(name: "HTML Rendering Core"),
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "HTML Rendering Core Tests",
            dependencies: [
                .product(name: "Byte", package: "swift-byte"),
                .target(name: "HTML Rendering Core"),
                .target(name: "HTML Rendering"),
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
