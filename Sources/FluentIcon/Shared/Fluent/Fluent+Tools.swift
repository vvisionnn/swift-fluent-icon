import CoreGraphics
import Foundation

extension Fluent {
	/// Returns an image with the selected icon
	///
	/// - Parameters:
	///   - size: the size of the returned image
	/// - Returns: an image that contains the selected icon
	public func asImage(size: CGSize) -> Fluent.Image {
		#if os(macOS)
		let image = Image(icon: self, size: size)
		image.isTemplate = true
		return image
		#elseif os(iOS) || os(watchOS) || os(tvOS)
		return Image(icon: self, size: size)
			.withRenderingMode(.alwaysTemplate)
		#endif
	}

	/// Returns a square image with the selected icon
	///
	/// - Parameters:
	///   - size: the height and width of the returned image
	/// - Returns: a square image that contains the selected icon
	public func asImage(size: CGFloat = 64) -> Fluent.Image {
		#if os(macOS)
		let image = Image(icon: self, size: CGSize(width: size, height: size))
		image.isTemplate = true
		return image
		#elseif os(iOS) || os(watchOS) || os(tvOS)
		return Image(icon: self, size: CGSize(width: size, height: size))
			.withRenderingMode(.alwaysTemplate)
		#endif
	}

	/// Returns an attributed string with the selected icon
	///
	/// - Parameters:
	///   - fontSize: the size of the font used in the string
	/// - Returns: an attributed string that contains the selected icon
	public func asAttributedText(fontSize: CGFloat = 48) -> NSAttributedString {
		NSAttributedString(icon: self, fontSize: fontSize)
	}
}

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
extension Fluent {
	/// A SwiftUI Image of the icon
	public var image: FluentIcon.Image<Self> {
		FluentIcon.Image(icon: self)
	}
}
#endif
