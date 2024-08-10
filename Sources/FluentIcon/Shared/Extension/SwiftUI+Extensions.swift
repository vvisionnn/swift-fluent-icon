#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
extension Font {
	var textStyle: Fluent.Font.TextStyle? {
		switch self {
		#if os(tvOS)
		case .largeTitle: nil
		#else
		case .largeTitle: .largeTitle
		#endif
		case .title: .title1
		case .title2: .title2
		case .title3: .title3
		case .headline: .headline
		case .subheadline: .subheadline
		case .body: .body
		case .callout: .callout
		case .footnote: .footnote
		case .caption: .caption1
		case .caption2: .caption2
		default: nil
		}
	}
}

@available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
extension Image.Scale {
	var value: CGFloat {
		switch self {
		case .small: 1 / 1.28571429
		case .medium: 1
		case .large: 1.28571429
		@unknown default: 1
		}
	}
}
#endif
