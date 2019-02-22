// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "project1",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMinor(from: "3.1.0")),
        // Tells package manager it must download from the Leaf repo on github
        .package(url: "https://github.com/vapor/leaf.git", .upToNextMinor(from: "3.0.0"))
    ],
    targets: [
        // Tells package manager that the App relies on both Vapor and Leaf to run
        .target(name: "App", dependencies: ["Vapor", "Leaf"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

