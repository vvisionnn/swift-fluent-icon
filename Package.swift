// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
  name: "swift-fluent-icon",
  platforms: [.iOS(.v15), .macOS(.v12)],
  products: [
    .library(
      name: "FluentIcon",
      targets: ["FluentIcon"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "FluentIcon",
      dependencies: [],
      resources: [.process("Resources")]
    ),
    .testTarget(
      name: "FluentIconTests",
      dependencies: ["FluentIcon"]
    ),
  ]
)
