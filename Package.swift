// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SyneriseSDK",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "SyneriseSDK", targets: ["SyneriseSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "SyneriseSDK",
            url: "https://github.com/Synerise/ios-sdk/releases/download/4.15.0/SyneriseSDK.xcframework.zip",
            checksum: "cafb00a9b1a708e1fb9a9cc41c9bd2bc47b95c2472822c0ed968c93dc2b8c763"
        )
    ]
)
