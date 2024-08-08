import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
  import Cocoa
#endif

extension Fluent.Image {
  public convenience init<Fluency: Fluent>(
    icon: Fluency,
    size: CGSize,
    color: Fluent.Color = .black,
    backgroundColor: Fluent.Color = .clear
  ) {
    let fontAspectRatio: CGFloat = 1
    let fontSize = min(size.width / fontAspectRatio, size.height)
    let attributedString = NSAttributedString(
      icon: icon,
      fontSize: fontSize,
      color: color,
      backgroundColor: backgroundColor
    )

    #if os(iOS) || os(watchOS) || os(tvOS)
      UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
      attributedString.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
      let image = UIGraphicsGetImageFromCurrentImageContext()

      UIGraphicsEndImageContext()
      if let image = image {
        let imageOrientation = image.imageOrientation
        self.init(cgImage: image.cgImage!, scale: image.scale, orientation: imageOrientation)
      } else {
        self.init()
      }
    #elseif os(OSX)
      let boxSize: NSSize = attributedString.size()
      let rect = NSRect(x: 0, y: 0, width: boxSize.width, height: boxSize.height)
      let image = NSImage(size: boxSize)
      image.lockFocus()
      backgroundColor.set()
      rect.fill()
      attributedString.draw(in: rect)
      image.unlockFocus()

      if let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) {
        self.init(cgImage: cgImage, size: boxSize)
      } else {
        self.init()
      }
    #endif
  }

  public convenience init<Fluency: Fluent>(
    icon: Fluency,
    size: CGFloat,
    color: Fluent.Color = .black,
    backgroundColor: Fluent.Color = .clear
  ) {
    self.init(
      icon: icon,
      size: CGSize(width: size, height: size),
      color: color,
      backgroundColor: backgroundColor
    )
  }

  #if os(iOS) || os(watchOS) || os(tvOS)

    public convenience init<Fluency: Fluent>(
      topIcon: Fluency,
      bottomIcon: Fluency,
      topIconColor: Fluent.Color = .black,
      bottomIconColor: Fluent.Color = .black,
      backgroundColor: Fluent.Color = .clear,
      size: CGSize? = nil
    ) {
      let bgSize: CGSize = size ?? CGSize(width: 32, height: 32)
      let topSize = CGSize(width: 2 * bgSize.width, height: 2 * bgSize.height)

      let topRect = CGRect(x: 0, y: 0, width: topSize.width, height: topSize.height)
      let bgRect = CGRect(
        x: bgSize.width / 2,
        y: bgSize.height / 2,
        width: bgSize.width,
        height: bgSize.height
      )

      let bgImage = UIImage(icon: bottomIcon, size: bgSize, color: bottomIconColor)
      let topImage = UIImage(icon: topIcon, size: topSize, color: topIconColor)

      UIGraphicsBeginImageContextWithOptions(topImage.size, false, 0.0)
      bgImage.draw(in: bgRect)
      topImage.draw(in: topRect)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      if let image = image {
        let imageOrientation = image.imageOrientation
        self.init(cgImage: image.cgImage!, scale: image.scale, orientation: imageOrientation)
      } else {
        self.init()
      }
    }

  #endif
}
