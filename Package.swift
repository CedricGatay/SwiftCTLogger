// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CTLogger",
    products: [
        .library(
            name: "CTLogger",
            targets: ["CTLogger"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CTLogger",
            dependencies: []),
        .testTarget(
            name: "CTLoggerTests",
            dependencies: ["CTLogger"]), //FIXME in 5.3 we can add "resources" to include .strings for testing
    ]
)
