enum FluentIconFont: String, AwesomeFont, CaseIterable {
	case regular = "FluentSystemIcons-Regular"
	case filled = "FluentSystemIcons-Filled"
	case light = "FluentSystemIcons-Light"
	case resizable = "FluentSystemIcons-Resizable"

	public var file: String { rawValue }
	public var name: String { file }

	var description: String {
		switch self {
		case .regular: return "Fluent System Icons Regular"
		case .filled: return "Fluent System Icons Filled"
		case .light: return "Fluent System Icons Light"
		case .resizable: return "Fluent System Icons Resizable"
		}
	}
}

extension FluentIcon.Regular: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.regular
	}
}

extension FluentIcon.Filled: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.filled
	}
}

extension FluentIcon.Light: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.light
	}
}

extension FluentIcon.Resizable: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.resizable
	}
}
