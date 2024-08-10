import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
import Cocoa
#endif

extension NSAttributedString {
	public convenience init<Fluency: Fluent>(icon: Fluency, fontSize: CGFloat) {
		FontRegistration.registerFonts()
		guard let font = Fluent.Font(name: icon.fontType.file, size: fontSize)
		else { fatalError("Did you forget to call FontRegistration.registerFonts()?") }

		let paragraph = NSMutableParagraphStyle()
		paragraph.alignment = .center
		let attributes = [
			NSAttributedString.Key.font: font,
			.foregroundColor: Fluent.Color.defaultColor,
			.backgroundColor: Fluent.Color.clear,
			.paragraphStyle: paragraph,
		]

		self.init(string: icon.rawValue, attributes: attributes)
	}
}
