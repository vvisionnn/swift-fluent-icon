// MARK: - FluentIconFont

enum FluentIconFont: String, AwesomeFont, CaseIterable {
	case regular = "FluentSystemIcons-Regular"
	case filled = "FluentSystemIcons-Filled"
	case light = "FluentSystemIcons-Light"
	case resizable = "FluentSystemIcons-Resizable"

	// MARK: Public

	public var file: String { rawValue }
	public var name: String { file }

	// MARK: Internal

	var description: String {
		switch self {
		case .regular: return "Fluent System Icons Regular"
		case .filled: return "Fluent System Icons Filled"
		case .light: return "Fluent System Icons Light"
		case .resizable: return "Fluent System Icons Resizable"
		}
	}
}

// MARK: - FluentIcon.Regular + Fluent

extension FluentIcon.Regular: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.regular
	}
}

// MARK: - FluentIcon.Filled + Fluent

extension FluentIcon.Filled: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.filled
	}
}

// MARK: - FluentIcon.Light + Fluent

extension FluentIcon.Light: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.light
	}
}

// MARK: - FluentIcon.Resizable + Fluent

extension FluentIcon.Resizable: Fluent {
	public var fontType: any AwesomeFont {
		FluentIconFont.resizable
	}
}