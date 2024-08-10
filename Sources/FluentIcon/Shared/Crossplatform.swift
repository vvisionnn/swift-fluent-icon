import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)

import UIKit

extension Fluent {
	public typealias Color = UIColor
	public typealias Font = UIFont
	public typealias Image = UIImage
}

#elseif os(OSX)
import AppKit
import Cocoa

extension Fluent {
	public typealias Color = NSColor
	public typealias Font = NSFont
	public typealias Image = NSImage
}

extension Fluent.Font {
	static func fontNames(forFamilyName: String) -> [String] {
		NSFontManager.shared.availableMembers(ofFontFamily: forFamilyName)?
			.compactMap { $0.first as? String } ?? []
	}
}
#endif

extension Fluent.Color {
	static var defaultColor: Fluent.Color {
		#if os(macOS)
		return .controlTextColor
		#elseif os(iOS) || os(watchOS) || os(tvOS)
		return Fluent.Color.tintColor
		#endif
	}
}
