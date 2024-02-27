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
            url: "https://github.com/Synerise/ios-sdk/releases/download/4.14.12/SyneriseSDK.xcframework.zip",
            checksum: "1dc720a8608a96e74c323478b95180ba127b3ded2589903345e50dc269c6c757"
        )
    ]
)
