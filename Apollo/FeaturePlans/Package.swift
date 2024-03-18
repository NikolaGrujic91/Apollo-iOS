// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeaturePlans",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FeaturePlans",
            targets: ["FeaturePlans"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "FeatureWeight", path: "FeatureWeight"),
        .package(name: "FoundationLocation", path: "FoundationLocation"),
        .package(name: "FoundationAudio", path: "FoundationAudio"),
        .package(name: "FoundationImages", path: "FoundationImages"),
        .package(name: "FoundationStorage", path: "FoundationStorage"),
        .package(name: "FoundationLogger", path: "FoundationLogger"),
        .package(name: "UtilityExtensions", path: "UtilityExtensions"),
        .package(url: "https://github.com/Flipboard/FLAnimatedImage.git", from: "1.0.17"),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.54.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FeaturePlans",
            dependencies: [
                .product(name: "FeatureWeight", package: "FeatureWeight"),
                .product(name: "FoundationStorage", package: "FoundationStorage"),
                .product(name: "FoundationLogger", package: "FoundationLogger"),
                .product(name: "FoundationLocation", package: "FoundationLocation"),
                .product(name: "FoundationAudio", package: "FoundationAudio"),
                .product(name: "FoundationImages", package: "FoundationImages"),
                .product(name: "UtilityExtensions", package: "UtilityExtensions"),
                .product(name: "FLAnimatedImage", package: "FLAnimatedImage"),
            ],
            resources: [
                .process("Resources"),
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
        .testTarget(
            name: "FeaturePlansTests",
            dependencies: ["FeaturePlans"],
            resources: [
                .process("Resources"),
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
    ]
)
