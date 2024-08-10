@testable import FluentIcon
import XCTest

final class FluentIconTests: XCTestCase {
	func testFluentIconRegularFontType() {
		let icon = FluentIcon.Regular.accessTime20
		XCTAssertTrue(icon.fontType is FluentIconFont)
		XCTAssertEqual(icon.fontType as? FluentIconFont, FluentIconFont.regular)
	}

	func testFluentIconFilledFontType() {
		let icon = FluentIcon.Filled.add12
		XCTAssertTrue(icon.fontType is FluentIconFont)
		XCTAssertEqual(icon.fontType as? FluentIconFont, FluentIconFont.filled)
	}

	func testFluentIconLightFontType() {
		let icon = FluentIcon.Light.add32
		XCTAssertTrue(icon.fontType is FluentIconFont)
		XCTAssertEqual(icon.fontType as? FluentIconFont, FluentIconFont.light)
	}

	func testFluentIconResizableFontType() {
		let icon = FluentIcon.Resizable.addFilled
		XCTAssertTrue(icon.fontType is FluentIconFont)
		XCTAssertEqual(icon.fontType as? FluentIconFont, FluentIconFont.resizable)
	}
}
