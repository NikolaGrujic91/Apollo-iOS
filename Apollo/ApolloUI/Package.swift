// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApolloUI",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ApolloUI",
            targets: ["ApolloUI"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "FoundationData", path: "FoundationData"),
        .package(name: "ApolloLocation", path: "ApolloLocation"),
        .package(name: "FoundationAudio", path: "FoundationAudio"),
        .package(name: "FeatureSettings", path: "FeatureSettings"),
        .package(name: "FoundationLogger", path: "FoundationLogger"),
        .package(name: "FoundationLocalization", path: "FoundationLocalization"),
        .package(name: "FoundationImages", path: "FoundationImages"),
        .package(name: "UtilityExtensions", path: "UtilityExtensions"),
        .package(url: "https://github.com/Flipboard/FLAnimatedImage.git", from: "1.0.17"),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.2.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ApolloUI",
            dependencies: [
                .product(name: "FoundationData", package: "FoundationData"),
                .product(name: "ApolloLocation", package: "ApolloLocation"),
                .product(name: "FoundationAudio", package: "FoundationAudio"),
                .product(name: "FeatureSettings", package: "FeatureSettings"),
                .product(name: "FoundationLogger", package: "FoundationLogger"),
                .product(name: "FoundationLocalization", package: "FoundationLocalization"),
                .product(name: "FoundationImages", package: "FoundationImages"),
                .product(name: "UtilityExtensions", package: "UtilityExtensions"),
                .product(name: "FLAnimatedImage", package: "FLAnimatedImage"),
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
        .testTarget(
            name: "ApolloUITests",
            dependencies: ["ApolloUI"],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
    ]
)
