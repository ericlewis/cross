// swift-tools-version:5.1
import PackageDescription

let package = Package(
  name: "Cross",
  platforms: [.macOS("10.15.4")],
  products: [
    .executable(
      name: "cross",
      targets: ["cross"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/ericlewis/swift-package-manager", .branch("release/5.6")),
    .package(url: "https://github.com/dduan/TOMLDecoder", from: "0.2.1"),
  ],
  targets: [
    .target(
      name: "CrossLib",
      dependencies: [
        .product(name: "SwiftPM-auto", package: "swift-package-manager"),
        .product(name: "TOMLDecoder", package: "TOMLDecoder")
      ]
    ),
    .target(
      name: "cross",
      dependencies: ["CrossLib"]
    ),
  ]
)
