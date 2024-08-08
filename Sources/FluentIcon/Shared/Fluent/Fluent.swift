import Foundation

public protocol Fluent: RawRepresentable, Hashable, CaseIterable where RawValue == String {
	/// Returns an object with information about the font used by the icon
	var fontType: AwesomeFont { get }
}

public protocol AwesomeFont: CustomStringConvertible {
	/// The file name that contains the font
	var file: String { get }
}
