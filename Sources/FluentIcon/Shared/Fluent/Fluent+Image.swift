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
			fontSize: fontSize
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
}
