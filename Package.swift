// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
	name: "swift-fluent-icon",
	platforms: [.iOS(.v15), .macOS(.v12)],
	products: [
		.library(name: "FluentIcon", targets: ["FluentIcon"]),
	],
	dependencies: [
		.package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.4"),
	],
	targets: [
		.target(
			name: "FluentIcon",
			dependencies: [],
			resources: [.process("Resources")]
		),
		.testTarget(
			name: "FluentIconTests",
			dependencies: [
				.target(name: "FluentIcon"),
				.product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
			]
		),
	]
)
