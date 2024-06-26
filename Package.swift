// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Ansi256Color",
    platforms: [
        .macOS(.v13),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Ansi256Color",
            targets: ["Ansi256Color"]),
    ],
    targets: [
        .target(
            name: "Ansi256Color"),
        .testTarget(
            name: "Ansi256ColorTests",
            dependencies: ["Ansi256Color"]),
    ]
)
