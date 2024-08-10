import Foundation

extension StringProtocol {
	/// Returns a new string with the first letter in upper case
	var firstUppercased: String {
		guard let first = first else { return "" }
		return String(first).uppercased() + dropFirst()
	}

	/// Returns a new string with the first letter capitalized
	var firstCapitalized: String {
		guard let first = first else { return "" }
		return String(first).capitalized + dropFirst()
	}

	/// Returns a new string where the separator has been prepended to each camel case
	func camelCaseToString(with separator: String = " ") -> String {
		let string = firstUppercased
		let regex = try! NSRegularExpression(pattern: "([A-Z][a-z\\.]*)")
		let range = NSRange(string.startIndex..., in: string)

		return regex.matches(
			in: string,
			options: .anchored,
			range: range
		)
		.map { String(string[Range($0.range, in: string)!]) }
		.joined(separator: separator)
	}
}
