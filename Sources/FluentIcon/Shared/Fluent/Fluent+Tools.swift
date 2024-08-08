import CoreGraphics
import Foundation

extension Fluent {
  /// Returns an image with the selected icon
  ///
  /// - Parameters:
  ///   - size: the size of the returned image
  ///   - color: the foreground color of the icon
  ///   - backgroundColor: the background color of the icon
  /// - Returns: an image that contains the selected icon
  public func asImage(
    size: CGSize,
    color: Color = Color.black,
    backgroundColor: Color = Color.clear
  )
    -> Fluent.Image {
    Image(icon: self, size: size, color: color, backgroundColor: backgroundColor)
  }

  /// Returns a square image with the selected icon
  ///
  /// - Parameters:
  ///   - size: the height and width of the returned image
  ///   - color: the foreground color of the icon
  ///   - backgroundColor: the background color of the icon
  /// - Returns: a square image that contains the selected icon
  public func asImage(
    size: CGFloat,
    color: Color = Color.black,
    backgroundColor: Color = Color.clear
  )
    -> Fluent.Image {
    Image(
      icon: self,
      size: CGSize(width: size, height: size),
      color: color,
      backgroundColor: backgroundColor
    )
  }

  /// Returns an attributed string with the selected icon
  ///
  /// - Parameters:
  ///   - fontSize: the size of the font used in the string
  ///   - color: the foreground color of the selected icon
  ///   - backgroundColor: the background color of the selected icon
  /// - Returns: an attributed string that contains the selected icon
  public func asAttributedText(
    fontSize: CGFloat,
    color: Color = Color.black,
    backgroundColor: Color = Color.clear
  )
    -> NSAttributedString {
    NSAttributedString(
      icon: self,
      fontSize: fontSize,
      color: color,
      backgroundColor: backgroundColor
    )
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
