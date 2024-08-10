@testable import FluentIcon
import XCTest

final class FluentIconFontTests: XCTestCase {
	func testFluentIconFontFile() {
		XCTAssertEqual(FluentIconFont.regular.file, "FluentSystemIcons-Regular")
		XCTAssertEqual(FluentIconFont.filled.file, "FluentSystemIcons-Filled")
		XCTAssertEqual(FluentIconFont.light.file, "FluentSystemIcons-Light")
		XCTAssertEqual(FluentIconFont.resizable.file, "FluentSystemIcons-Resizable")
	}

	func testFluentIconFontName() {
		XCTAssertEqual(FluentIconFont.regular.name, "FluentSystemIcons-Regular")
		XCTAssertEqual(FluentIconFont.filled.name, "FluentSystemIcons-Filled")
		XCTAssertEqual(FluentIconFont.light.name, "FluentSystemIcons-Light")
		XCTAssertEqual(FluentIconFont.resizable.name, "FluentSystemIcons-Resizable")
	}

	func testFluentIconFontDescription() {
		XCTAssertEqual(FluentIconFont.regular.description, "Fluent System Icons Regular")
		XCTAssertEqual(FluentIconFont.filled.description, "Fluent System Icons Filled")
		XCTAssertEqual(FluentIconFont.light.description, "Fluent System Icons Light")
		XCTAssertEqual(FluentIconFont.resizable.description, "Fluent System Icons Resizable")
	}
}
