import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)

import UIKit

extension Fluent {
	public typealias Color = UIColor
	public typealias Font = UIFont
	public typealias Image = UIImage
}

#elseif os(OSX)
import Cocoa
import AppKit

extension Fluent {
	public typealias Color = NSColor
	public typealias Font = NSFont
	public typealias Image = NSImage
}

extension Fluent.Font {
	static func fontNames(forFamilyName: String) -> [String] {
		return NSFontManager.shared.availableMembers(ofFontFamily: forFamilyName)?
			.compactMap { return $0.first as? String } ?? []
	}
}

#endif
