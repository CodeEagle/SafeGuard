// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SafeGuard",
    products: [
        .library(
            name: "SafeGuardKit",
            targets: ["SafeGuard"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SafeGuard",
            dependencies: ["SafeGuardOC"]
        ),
        .target(
            name: "SafeGuardOC",
            dependencies: []
        ),
        .testTarget(
            name: "SafeGuardTests",
            dependencies: ["SafeGuard"]
        ),
    ]
)
