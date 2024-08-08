import Foundation

// MARK: - Fluent

public protocol Fluent: RawRepresentable, Hashable, CaseIterable where RawValue == String {
	/// Returns an object with information about the font used by the icon
	var fontType: AwesomeFont { get }
}

// MARK: - AwesomeFont

public protocol AwesomeFont: CustomStringConvertible {
	/// The file name that contains the font
	var file: String { get }
}
