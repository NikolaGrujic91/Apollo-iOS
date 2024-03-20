// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationLocalization",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FoundationLocalization",
            targets: ["FoundationLocalization"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "SharedUI", path: "SharedUI"),
        .package(name: "FoundationLogger", path: "FoundationLogger"),
        .package(name: "FoundationStorage", path: "FoundationStorage"),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.54.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FoundationLocalization",
            dependencies: [
                .product(name: "SharedUI", package: "SharedUI"),
                .product(name: "FoundationLogger", package: "FoundationLogger"),
                .product(name: "FoundationStorage", package: "FoundationStorage"),
            ],
            resources: [
                .process("Resources"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
        .testTarget(
            name: "FoundationLocalizationTests",
            dependencies: [
                "FoundationLocalization",
                .product(name: "FoundationLogger", package: "FoundationLogger"),
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
    ]
)
