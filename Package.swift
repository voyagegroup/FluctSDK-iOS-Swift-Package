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
                      url: "https://github.com/voyagegroup/FluctSDK-iOS-Swift-Package/releases/download/6.44.6/FluctSDK.xcframework.zip", checksum: "4f980d6e6cb6d19fef699a037c28a642b7417e365231106077e32955063376ae"),
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