import CoreGraphics
import CoreText
import Foundation

public enum FontRegistration {
	public static func registerFonts(from bundle: Bundle? = nil) {
		#if SWIFT_PACKAGE
		let fontBundle = bundle ?? Bundle.module
		#else
		let fontBundle = bundle ?? Bundle(for: Self.self)
		#endif
		FluentIconFont.allCases.forEach { font in
			registerFont(bundle: fontBundle, fontName: font.file, fontExtension: "ttf")
		}
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
