#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
extension FluentIcon {
	/// A view wrapper around an FluentIcon.Image
	public struct Image<FluentType>: View where FluentType: Fluent {
		@Environment(\.colorScheme) var colorScheme
		@Environment(\.imageScale) var imageScale
		@Environment(\.font) var font

		var forcedSize: CGSize?
		var isResizable: Bool
		var capInsets: EdgeInsets
		var resizingMode: SwiftUI.Image.ResizingMode
		var icon: FluentType

		var size: CGSize {
			if let size = forcedSize { return size }
			let textStyle = font?.textStyle ?? .body
			let size = Fluent.Font.preferredFont(forTextStyle: textStyle).pointSize * imageScale.value
			return CGSize(width: size, height: size)
		}

		var image: SwiftUI.Image {
			#if os(iOS) || os(watchOS) || os(tvOS)
			SwiftUI.Image(uiImage: icon.asImage(size: size))
			#elseif os(macOS)
			SwiftUI.Image(nsImage: icon.asImage(size: size))
			#endif
		}

		/// Creates a fluent icon image.
		///
		/// This initializer creates an image using a Fluent Icon.
		///
		/// - Parameters:
		///   - icon: The icon to use
		public init(icon: FluentType) {
			self.icon = icon
			self.forcedSize = nil
			self.isResizable = false
			self.capInsets = EdgeInsets()
			self.resizingMode = .stretch
		}

		public var body: some View {
			if isResizable {
				image.resizable(capInsets: capInsets, resizingMode: resizingMode)
			} else {
				image
			}
		}
	}
}

extension FluentIcon.Image {
	/// Changes the size of the underlying image. This will disable the automatic sizing based on the font
	///
	/// - Parameter size: The size to change to
	///
	/// - Returns: An image that uses the size you supply
	public func size(_ size: CGFloat) -> Self {
		var view = self
		view.forcedSize = CGSize(width: size, height: size)
		return view
	}

	/// Changes the size of the underlying image. This will disable the automatic sizing based on the font
	///
	/// - Parameter size: The size to change to
	///
	/// - Returns: An image that uses the size you supply
	public func size(_ size: CGSize) -> Self {
		var view = self
		view.forcedSize = size
		return view
	}

	/// Sets the mode by which SwiftUI resizes an image to fit its space.
	///
	/// - Parameters:
	///   - capInsets: Inset values that indicate a portion of the image that SwiftUI doesn't resize.
	///   - resizingMode: The mode by which SwiftUI resizes the image.
	///
	/// - Returns: An image, with the new resizing behavior set.
	public func resizable(
		capInsets: EdgeInsets = EdgeInsets(),
		resizingMode: SwiftUI.Image.ResizingMode = .stretch
	) -> Self {
		var view = self
		view.isResizable = true
		view.capInsets = capInsets
		view.resizingMode = resizingMode
		return view
	}
}
#endif
