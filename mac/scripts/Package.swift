// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MouseControl",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "move-mouse-to-last-screen", targets: ["LastScreen"]),
        .executable(name: "move-mouse-to-next-screen", targets: ["NextScreen"]),
        .executable(name: "move-app", targets: ["MoveApp"]),
        .library(name: "Utils", targets: ["Utils"]),
    ],
    targets: [
        .target(
            name: "Utils",
            path: "src/utils"
        ),

        .executableTarget(
            name: "MoveApp",
            dependencies: ["Utils"],
            path: "src/targets",
            exclude: ["move-mouse-to-next-screen.swift", "move-mouse-to-last-screen.swift"],
            sources: ["move-app.swift"]
        ),

        .executableTarget(
            name: "LastScreen",
            dependencies: ["Utils"],
            path: "src/targets",
            exclude: ["move-mouse-to-next-screen.swift", "move-app.swift"],
            sources: ["move-mouse-to-last-screen.swift"]
        ),
        .executableTarget(
            name: "NextScreen",
            dependencies: ["Utils"],
            path: "src/targets",
            exclude: ["move-mouse-to-last-screen.swift", "move-app.swift"],
            sources: ["move-mouse-to-next-screen.swift"]
        ),
    ]
)
