// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureWeight",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FeatureWeight",
            targets: ["FeatureWeight"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "FoundationLogger", path: "FoundationLogger"),
        .package(name: "FoundationLocalization", path: "FoundationLocalization"),
        .package(name: "FoundationStorage", path: "FoundationStorage"),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.53.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FeatureWeight",
            dependencies: [
                .product(name: "FoundationLogger", package: "FoundationLogger"),
                .product(name: "FoundationLocalization", package: "FoundationLocalization"),
                .product(name: "FoundationStorage", package: "FoundationStorage"),
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
        .testTarget(
            name: "FeatureWeightTests",
            dependencies: ["FeatureWeight"],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
    ]
)
