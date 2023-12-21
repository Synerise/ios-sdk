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
            url: "https://github.com/Synerise/ios-sdk/releases/download/4.14.9/SyneriseSDK.xcframework.zip",
            checksum: "433ef0b8cfe11f1e4d2508a1b467d715bcf7cbcb2b978105d23ae1091ca6c5d8"
        )
    ]
)
