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
            url: "https://github.com/myGaru/mygaru-idr-ios-sdk/releases/download/0.0.4/myGaruIdent.xcframework.zip",
            checksum: "575723b115ab0422599a110c03ac8f9815eb978863b832e17015721eb7ae2f1b"
        ),
        .testTarget(
            name: "myGaruIdentTests",
            dependencies: ["myGaruIdent"]
        ),
    ]
)
