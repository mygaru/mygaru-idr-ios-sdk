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
            url: "https://github.com/myGaru/myGaruIdent/releases/download/0.0.2/myGaruIdent.xcframework.zip",
            checksum: "8675a74c6abb1e5e7601072ddd047f7d2398e7e8b4650779ef92b4a4e6e99d0e"
        ),
        .testTarget(
            name: "myGaruIdentTests",
            dependencies: ["myGaruIdent"]
        ),
    ]
)
