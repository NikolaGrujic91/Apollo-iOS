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
        .package(name: "ApolloData", path: "ApolloData"),
        .package(name: "ApolloLogger", path: "ApolloLogger"),
        .package(name: "ApolloTheme", path: "ApolloTheme"),
        .package(name: "ApolloLocalization", path: "ApolloLocalization"),
        .package(name: "ApolloImages", path: "ApolloImages"),
        .package(name: "ApolloWeight", path: "ApolloWeight"),
        .package(name: "ApolloLocation", path: "ApolloLocation"),
        .package(name: "ApolloAudio", path: "ApolloAudio"),
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
                .product(name: "ApolloData", package: "ApolloData"),
                .product(name: "ApolloLogger", package: "ApolloLogger"),
                .product(name: "ApolloTheme", package: "ApolloTheme"),
                .product(name: "ApolloLocalization", package: "ApolloLocalization"),
                .product(name: "ApolloImages", package: "ApolloImages"),
                .product(name: "ApolloWeight", package: "ApolloWeight"),
                .product(name: "ApolloLocation", package: "ApolloLocation"),
                .product(name: "ApolloAudio", package: "ApolloAudio"),
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
