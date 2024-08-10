#if os(macOS)
import AppKit
@testable import FluentIcon
import XCTest

final class FluentFontExtensionTests: XCTestCase {
	func testFontNamesForExistingFamily() {
		let fontFamily = "Helvetica"
		let fontNames = Fluent.Font.fontNames(forFamilyName: fontFamily)
		XCTAssertFalse(fontNames.isEmpty, "Font names should not be empty for existing font family \(fontFamily)")
	}

	func testFontNamesForNonExistingFamily() {
		let fontFamily = "NonExistingFontFamily"
		let fontNames = Fluent.Font.fontNames(forFamilyName: fontFamily)
		XCTAssertTrue(fontNames.isEmpty, "Font names should be empty for non-existing font family \(fontFamily)")
	}

	func testFontNamesForEmptyFamilyName() {
		let fontFamily = ""
		let fontNames = Fluent.Font.fontNames(forFamilyName: fontFamily)
		XCTAssertTrue(fontNames.isEmpty, "Font names should be empty for empty font family name")
	}
}
#endif
