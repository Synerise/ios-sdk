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
            url: "https://github.com/Synerise/ios-sdk/releases/download/4.16.0/SyneriseSDK.xcframework.zip",
            checksum: "b9fe4f31479e5144e0f11f0ec68e0fabb67a9d7525afcf5579efea418b92671e"
        )
    ]
)
