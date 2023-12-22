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
            url: "https://github.com/Synerise/ios-sdk/releases/download/4.14.10/SyneriseSDK.xcframework.zip",
            checksum: "6bc6d90ccd917607fa5c32e399356ba2dc1ef4ce2654894a5e4a78bad302514d"
        )
    ]
)
