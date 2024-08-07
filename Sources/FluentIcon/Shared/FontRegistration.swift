import CoreGraphics
import CoreText
import Foundation

extension String {
	static let fluentIconName = "FluentSystemIcons-Resizable"
}

public enum FontRegistration {
	public static func registerFonts(from bundle: Bundle? = nil) {
#if SWIFT_PACKAGE
		let fontBundle = bundle ?? Bundle.module
#else
		let fontBundle = bundle ?? Bundle(for: Self.self)
#endif
		registerFont(bundle: fontBundle, fontName: "FluentSystemIcons-Resizable", fontExtension: "ttf")
	}

	fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
		guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
		      let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
		      let font = CGFont(fontDataProvider)
		else { fatalError("Couldn't create font from data") }
		var error: Unmanaged<CFError>?
		CTFontManagerRegisterGraphicsFont(font, &error)
	}
}
