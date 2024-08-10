#if os(macOS)
@testable import FluentIcon
import SnapshotTesting
import XCTest

final class FluentIconColorMacosTests: XCTestCase {
	@MainActor
	func testDefaultColor() {
		let icon = NSImageView(image: FluentIcon.Filled.sparkle48.asImage())
		icon.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		assertSnapshot(of: icon, as: .image)
	}

	@MainActor
	func testTintedColor() {
		let tintedIcon = NSImageView(image: FluentIcon.Filled.sparkle48.asImage())
		tintedIcon.contentTintColor = .red
		tintedIcon.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		assertSnapshot(of: tintedIcon, as: .image)
	}
}
#endif
