// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "GlueCode",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .executable(
            name: "GlueCode",
            targets: ["GlueCode"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
        .package(name: "SassPublishPlugin", url: "https://github.com/hejki/sasspublishplugin", from: "0.1.0"),
        .package(name: "SplashPublishPlugin", url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0")
    ],
    targets: [
        .executableTarget(
            name: "GlueCode",
            dependencies: [
                "Publish",
                "SassPublishPlugin",
                "SplashPublishPlugin",
                "SassDSL"
            ]
        ),
        .target(
            name: "SassDSL"
        ),
        .target(
            name: "BulmaForPublish",
            dependencies: ["SassDSL"],
            resources: [
                .copy("Style/Bulma")
            ]
        ),
        .testTarget(
            name: "SassDSLTests",
            dependencies: ["SassDSL"]
        )
    ]
)
