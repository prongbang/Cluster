// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cluster",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Cluster",
            targets: ["Cluster"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Cluster",
            dependencies: [],
            path: ".",
            exclude: [
                ".github",
                "Cluster.xcodeproj",
                "Example",
                "Images",
                "docs",
                ".gitignore",
                ".travis.yml",
                "CHANGELOG.md",
                "Cluster.podspec",
                "LICENSE",
                "README.md"
            ],
            sources: ["Sources"],
            swiftSettings: [
                .define("SUPPORT_ARM64")
            ],
            linkerSettings: [
                .linkedFramework("Foundation")
            ]
        ),
        .testTarget(
            name: "ClusterTests",
            dependencies: ["Cluster"],
            path: "Tests",
            exclude: [],
            swiftSettings: [
                .define("TESTING")
            ]
        )
    ]
)