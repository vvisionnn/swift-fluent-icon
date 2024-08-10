@testable import FluentIcon
import XCTest

class StringProtocolExtensionTests: XCTestCase {
	// Test that the firstUppercased property returns a new string with the first letter in upper case
	func testFirstUppercasedReturnsNewStringWithFirstLetterInUpperCase() {
		XCTAssertEqual("helloWorld".firstUppercased, "HelloWorld")
		XCTAssertEqual("HelloWorld".firstUppercased, "HelloWorld")
		XCTAssertEqual("".firstUppercased, "")
	}

	// Test that the firstCapitalized property returns a new string with the first letter capitalized
	func testFirstCapitalizedReturnsNewStringWithFirstLetterCapitalized() {
		XCTAssertEqual("helloWorld".firstCapitalized, "HelloWorld")
		XCTAssertEqual("HelloWorld".firstCapitalized, "HelloWorld")
		XCTAssertEqual("".firstCapitalized, "")
	}

	// Test that the camelCaseToString(with:) method returns a new string where the separator has been prepended to each camel case
	func testCamelCaseToStringWithSeparatorPrependsSeparatorToEachCamelCase() {
		XCTAssertEqual("helloWorld".camelCaseToString(with: " "), "Hello World")
		XCTAssertEqual("hello".camelCaseToString(with: " "), "Hello")
		XCTAssertEqual("".camelCaseToString(with: " "), "")
		XCTAssertEqual("helloWorldTest".camelCaseToString(with: " "), "Hello World Test")
	}

	// Test that the camelCaseToString(with:) method returns a new string with no separator when an empty string is passed
	func testCamelCaseToStringWithEmptySeparatorReturnsNoSeparator() {
		XCTAssertEqual("helloWorld".camelCaseToString(with: ""), "HelloWorld")
		XCTAssertEqual("hello".camelCaseToString(with: ""), "Hello")
		XCTAssertEqual("".camelCaseToString(with: ""), "")
		XCTAssertEqual("helloWorldTest".camelCaseToString(with: ""), "HelloWorldTest")
	}
}
