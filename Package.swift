// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

import PackageDescription

let package = Package(
    name: "myGaruIdent",
    products: [
        .library(
            name: "myGaruIdent",
            targets: ["myGaruIdent"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "myGaruIdent",
            url: "https://github.com/myGaru/mygaru-idr-ios-sdk/releases/download/0.0.3/myGaruIdent.xcframework.zip",
            checksum: "1f24d16cf5ae010e21f9236d2c6d7d6359dfbbc7a6ab7e12f5eae2cf5fdabd44"
        ),
        .testTarget(
            name: "myGaruIdentTests",
            dependencies: ["myGaruIdent"]
        ),
    ]
)
