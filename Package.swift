// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "banking-ios",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
        .library(name: "TabsFeature", targets: ["TabsFeature"]),
        .library(name: "Styleguide", targets: ["Styleguide"]),
        .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.9.2"),
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "TabsFeature",
            ]
        ),
        .target(
            name: "HomeFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Styleguide",
                "SwiftUIHelpers"
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "TabsFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "HomeFeature",
                "Styleguide",
                "SwiftUIHelpers"
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "Styleguide",
            dependencies: [],
            resources: [.process("Resources")]
        ),
        .target(
            name: "SwiftUIHelpers",
            dependencies: [
                "Styleguide",
            ],
            resources: [.process("Resources")]
        ),
    ]
)
