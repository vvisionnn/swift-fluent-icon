import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import Cocoa
import AppKit
#endif

extension NSAttributedString {
	public convenience init<Fluency: Fluent>(
		icon: Fluency,
		fontSize: CGFloat,
		color: Fluent.Color = .black,
		backgroundColor: Fluent.Color = .clear
	) {
		FontRegistration.registerFonts()
		guard let font = Fluent.Font(name: icon.fontType.file, size: fontSize) else {
			fatalError("Fluent Icon font not loaded properly. Did you forget to call FontRegistration.registerFonts()?")
		}

		let paragraph = NSMutableParagraphStyle()
		paragraph.alignment = .center
		let attributes = [
			NSAttributedString.Key.font: font,
			.foregroundColor: color,
			.backgroundColor: backgroundColor,
			.paragraphStyle: paragraph
		]

		self.init(string: icon.rawValue, attributes: attributes)
	}
}
