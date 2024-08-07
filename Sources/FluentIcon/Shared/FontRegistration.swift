import CoreGraphics
import CoreText
import Foundation

extension String {
	package static let fluentIconName = "FluentSystemIcons-Resizable"
}

public enum FontRegistration {
	public static func registerFonts(from bundle: Bundle? = nil) {
#if SWIFT_PACKAGE
		let fontBundle = bundle ?? Bundle.module
#else
		let fontBundle = bundle ?? Bundle(for: Self.self)
#endif
		registerFont(bundle: fontBundle, fontName: .fluentIconName, fontExtension: "ttf")
	}

	fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
		// registry when it is capable
		guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
		      let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
		      let font = CGFont(fontDataProvider)
		else { return }
		// ignore error
		CTFontManagerRegisterGraphicsFont(font, nil)
	}
}
