@testable import FluentIcon
import SwiftUI
import XCTest

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
final class FontExtensionTests: XCTestCase {
	func testTextStyleForLargeTitle() {
		#if os(tvOS)
		XCTAssertNil(Font.largeTitle.textStyle)
		#else
		XCTAssertEqual(Font.largeTitle.textStyle, Fluent.Font.TextStyle.largeTitle)
		#endif
	}

	func testTextStyleForTitle() {
		XCTAssertEqual(Font.title.textStyle, Fluent.Font.TextStyle.title1)
	}

	func testTextStyleForTitle2() {
		XCTAssertEqual(Font.title2.textStyle, Fluent.Font.TextStyle.title2)
	}

	func testTextStyleForTitle3() {
		XCTAssertEqual(Font.title3.textStyle, Fluent.Font.TextStyle.title3)
	}

	func testTextStyleForHeadline() {
		XCTAssertEqual(Font.headline.textStyle, Fluent.Font.TextStyle.headline)
	}

	func testTextStyleForSubheadline() {
		XCTAssertEqual(Font.subheadline.textStyle, Fluent.Font.TextStyle.subheadline)
	}

	func testTextStyleForBody() {
		XCTAssertEqual(Font.body.textStyle, Fluent.Font.TextStyle.body)
	}

	func testTextStyleForCallout() {
		XCTAssertEqual(Font.callout.textStyle, Fluent.Font.TextStyle.callout)
	}

	func testTextStyleForFootnote() {
		XCTAssertEqual(Font.footnote.textStyle, Fluent.Font.TextStyle.footnote)
	}

	func testTextStyleForCaption1() {
		XCTAssertEqual(Font.caption.textStyle, Fluent.Font.TextStyle.caption1)
	}

	func testTextStyleForCaption2() {
		XCTAssertEqual(Font.caption2.textStyle, Fluent.Font.TextStyle.caption2)
	}

	func testTextStyleForDefault() {
		let customFont = Font.custom("CustomFont", size: 12)
		XCTAssertNil(customFont.textStyle)
	}
}
