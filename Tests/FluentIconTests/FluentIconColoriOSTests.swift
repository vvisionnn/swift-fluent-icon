#if os(iOS)
@testable import FluentIcon
import SnapshotTesting
import SwiftUI
import XCTest

final class FluentIconColorMacosTests: XCTestCase {
	@MainActor
	func testDefaultColor() {
		let icon = UIImageView(image: FluentIcon.Filled.sparkle48.asImage())
		icon.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testTintedColor() {
		let tintedIcon = UIImageView(image: FluentIcon.Filled.sparkle48.asImage())
		tintedIcon.tintColor = .red
		tintedIcon.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		assertSnapshot(of: tintedIcon, as: .image)
	}

	@MainActor
	func testSizeUpdate() {
		let icon = UIImageView(image: FluentIcon.Filled.sparkle48.asImage())
		icon.frame = CGRect(x: 0, y: 0, width: 96, height: 96)
		assertSnapshot(of: icon, as: .image)
		
		let icon2 = UIImageView(image: Fluent.Image.init(icon: FluentIcon.Filled.cast20, size: 96))
		icon2.frame = CGRect(x: 0, y: 0, width: 96, height: 96)
		assertSnapshot(of: icon2, as: .image)
	}

	@MainActor
	func testSwiftUIDefaultColor() {
		let icon = FluentIcon.Filled.sparkle48.image
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testSwiftUITintedColor() {
		let icon = FluentIcon.Filled.sparkle48.image
			.foregroundStyle(Color.red)
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testSwiftUISizeUpdate() {
		let icon = FluentIcon.Filled.sparkle48.image
			.frame(width: 96, height: 96)
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testSwiftUICustomSizeUpdate() {
		let icon = FluentIcon.Filled.sparkle48.image.size(96)
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testSwiftUICustomCGSizeUpdate() {
		let icon = FluentIcon.Filled.sparkle48.image.size(CGSize(width: 32, height: 32))
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testSwiftUIResizable() {
		let icon = FluentIcon.Filled.sparkle48.image.size(48)
			.resizable()
			.frame(width: 96, height: 96)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideTitle() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.title)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideTitle2() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.title2)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideTitle3() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.title3)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideHeadline() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.headline)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideSubheadline() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.subheadline)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideBody() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.body)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideCallout() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.callout)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideFootnote() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.footnote)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideCaption1() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.caption)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideCaption2() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.caption2)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testFontSizeOverrideLargeTitle() {
		let icon = FluentIcon.Filled.sparkle48.image
			.font(.largeTitle)
		assertSnapshot(of: icon, as: .image)
	}
	
	@MainActor
	func testAsAttributedText() {
		let icon = FluentIcon.Filled.sparkle48.asAttributedText()
		assertSnapshot(of: icon, as: .dump)
	}
}
#endif
