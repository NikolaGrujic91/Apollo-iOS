// swift-tools-version: 5.9
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
        .package(name: "FeatureSettings", path: "FeatureSettings"),
        .package(name: "FoundationData", path: "FoundationData"),
        .package(name: "FoundationLocation", path: "FoundationLocation"),
        .package(name: "FoundationAudio", path: "FoundationAudio"),
        .package(name: "FoundationImages", path: "FoundationImages"),
        .package(name: "UtilityExtensions", path: "UtilityExtensions"),
        .package(url: "https://github.com/Flipboard/FLAnimatedImage.git", from: "1.0.17"),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.52.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FeaturePlans",
            dependencies: [
                .product(name: "FoundationData", package: "FoundationData"),
                .product(name: "FoundationLocation", package: "FoundationLocation"),
                .product(name: "FoundationAudio", package: "FoundationAudio"),
                .product(name: "FeatureSettings", package: "FeatureSettings"),
                .product(name: "FoundationImages", package: "FoundationImages"),
                .product(name: "UtilityExtensions", package: "UtilityExtensions"),
                .product(name: "FLAnimatedImage", package: "FLAnimatedImage"),
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
        .testTarget(
            name: "FeaturePlansTests",
            dependencies: ["FeaturePlans"],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
    ]
)
