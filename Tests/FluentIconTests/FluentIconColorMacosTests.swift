#if os(macOS)
@testable import FluentIcon
import SnapshotTesting
import SwiftUI
import XCTest

final class FluentIconColorMacosTests: XCTestCase {
	override func invokeTest() {
		withSnapshotTesting(diffTool: .ksdiff) {
			super.invokeTest()
		}
	}

	@MainActor
	func testDefaultColor() {
		let icon = NSImageView(image: FluentIcon.Filled.sparkle48.asImage())
		icon.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 48, height: 48)
			)
		)
	}

	@MainActor
	func testTintedColor() {
		let tintedIcon = NSImageView(image: FluentIcon.Filled.sparkle48.asImage())
		tintedIcon.contentTintColor = .red
		tintedIcon.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		assertSnapshot(
			of: tintedIcon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 48, height: 48)
			)
		)
	}

	@MainActor
	func testSizeUpdate() {
		let icon = NSImageView(image: FluentIcon.Filled.sparkle48.asImage())
		icon.frame = CGRect(x: 0, y: 0, width: 96, height: 96)
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 96, height: 96)
			)
		)

		let icon2 = NSImageView(image: Fluent.Image(icon: FluentIcon.Filled.cast20, size: 96))
		icon2.frame = CGRect(x: 0, y: 0, width: 96, height: 96)
		assertSnapshot(
			of: icon2,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 96, height: 96)
			)
		)
	}

	@MainActor
	func testSwiftUIDefaultColor() {
		let icon = FluentIcon.Filled.sparkle48.image
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 50, height: 50)
			)
		)
	}

	@MainActor
	func testSwiftUITintedColor() {
		let icon = FluentIcon.Filled.sparkle48.image
			.foregroundStyle(Color.red)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 48, height: 48)
			)
		)
	}

	@MainActor
	func testSwiftUISizeUpdate() {
		let icon = FluentIcon.Filled.sparkle48.image
			.frame(width: 96, height: 96)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 96, height: 96)
			)
		)
	}

	@MainActor
	func testSwiftUICustomSizeUpdate() {
		let icon = FluentIcon.Filled.sparkle48.image
			.size(96)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 96, height: 96)
			)
		)
	}

	@MainActor
	func testSwiftUICustomCGSizeUpdate() {
		let icon = FluentIcon.Filled.sparkle48.image
			.size(CGSize(width: 32, height: 32))
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testSwiftUIResizable() {
		let icon = FluentIcon.Filled.sparkle48.image.size(48)
			.resizable()
			.frame(width: 96, height: 96)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 96, height: 96)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideTitle() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.title)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 50, height: 50)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideTitle2() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.title2)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideTitle3() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.title3)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideHeadline() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.headline)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideSubheadline() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.subheadline)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideBody() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.body)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideCallout() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.callout)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideFootnote() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.footnote)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideCaption1() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.caption)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideCaption2() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.caption2)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testFontSizeOverrideLargeTitle() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.largeTitle)
			.wrapIntoNSHostingView()
		assertSnapshot(
			of: icon,
			as: .image(
				precision: 0.95,
				perceptualPrecision: 0.95,
				size: .init(width: 32, height: 32)
			)
		)
	}

	@MainActor
	func testAsAttributedText() {
		let icon = FluentIcon.Filled.sparkle48.asAttributedText()
		assertSnapshot(of: icon, as: .dump)
	}
}

extension View {
	func wrapIntoNSHostingView() -> NSHostingView<Self> {
		NSHostingView(rootView: self)
	}
}
#endif
