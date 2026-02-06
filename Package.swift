// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "FluctSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FluctSDK",
            targets: ["FluctSDKResources"])
    ],
    targets: [
        .binaryTarget(name: "FluctSDK",
                      url: "https://github.com/voyagegroup/FluctSDK-iOS-Swift-Package/releases/download/6.40.2/FluctSDK.xcframework.zip", checksum: "7ccb0b7195beeca2ceb52261e80bdef2a0531b97bb078002e34bf3b1bc41140d"),
        .target(
            name: "FluctSDKResources",
            dependencies: [
                .target(name: "FluctSDK")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("AVKit"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Foundation"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit")

                // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                // For now, these flags should be added manually to the project for integration.
                //                 .unsafeFlags(["-ObjC"])
            ]),
        .testTarget(
            name: "FluctSDKTests",
            dependencies: ["FluctSDK"]
        )
    ]
)