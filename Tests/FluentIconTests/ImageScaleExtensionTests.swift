@testable import FluentIcon
import SwiftUI
import XCTest

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
final class ImageScaleExtensionTests: XCTestCase {
	func testValueForSmallScale() {
		XCTAssertEqual(Image.Scale.small.value, 1 / 1.28571429)
	}

	func testValueForMediumScale() {
		XCTAssertEqual(Image.Scale.medium.value, 1)
	}

	func testValueForLargeScale() {
		XCTAssertEqual(Image.Scale.large.value, 1.28571429)
	}
}
