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
                      url: "https://github.com/voyagegroup/FluctSDK-iOS-Swift-Package/releases/download/0.0.2/FluctSDK.xcframework.zip", checksum: "3fdbb525dfa665823610ad74efcd5c2bf56252db905c10a555c3b857cd49b41a"),
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