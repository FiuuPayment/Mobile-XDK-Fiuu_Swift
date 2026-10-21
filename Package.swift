// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mobile-XDK-Fiuu_Swift",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Mobile-XDK-Fiuu_Swift",
            targets: ["FiuuXDKSwift"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "FiuuXDKSwift",
            url: "https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift/releases/download/2.0.3/FiuuXDKSwift.xcframework.zip",
            checksum: "4fc4f0611763e00a716fc32332bbc901a6311b67a2bc8c62c97be357ca7932b0"
        )
    ]
)
