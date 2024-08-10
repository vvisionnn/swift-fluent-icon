import FluentIcon
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
	@State var selectedVariant: FluentIconVariant = .regular

	var body: some View {
		ZStack {
			switch selectedVariant {
			case .regular: FluentIconDisplayView(icon: FluentIcon.Regular.self)
			case .filled: FluentIconDisplayView(icon: FluentIcon.Filled.self)
			case .light: FluentIconDisplayView(icon: FluentIcon.Light.self)
			case .resizable: FluentIconDisplayView(icon: FluentIcon.Resizable.self)
			}
		}
		.toolbar(content: {
			ToolbarItem(placement: .principal) {
				Picker("Variant", selection: $selectedVariant) {
					ForEach(FluentIconVariant.allCases, id: \.self) { variant in
						Text(variant.rawValue.capitalized).tag(variant)
					}
				}
				.pickerStyle(.segmented)
			}
		})
		.toolbarTitleDisplayMode(.inline)
	}
}

// MARK: - FluentIconVariant

enum FluentIconVariant: String, CaseIterable {
	case regular
	case filled
	case light
	case resizable
}

// MARK: - FluentIconDisplayView

struct FluentIconDisplayView<
	Icon: Fluent & Identifiable
>: View where Icon.AllCases: RandomAccessCollection {
	let icon: Icon.Type

	@Environment(\.colorScheme) var colorScheme

	var body: some View {
		GeometryReader { proxy in
			ScrollView {
				let spacing = 8
				let fullWidth = proxy.size.width
				let columnCount = Int(Double(fullWidth) / 140)
				let columnWidth = (fullWidth - CGFloat(columnCount + 3) * CGFloat(spacing)) /
					CGFloat(columnCount)
				LazyVGrid(
					columns: Array(
						repeating: GridItem(
							.fixed(columnWidth),
							spacing: CGFloat(spacing)
						),
						count: columnCount
					)
				) {
					ForEach(icon.allCases, id: \.self) { icon in
						VStack(spacing: 0) {
							icon.image
								.size(columnWidth - 40)
								.frame(width: columnWidth, height: columnWidth)

							Text("\(icon)")
								.font(.caption)
								.lineLimit(1)
								.padding(.horizontal, 4)
								.foregroundStyle(Color.primary)
						}
						.padding(.bottom)
						.background(
							RoundedRectangle(cornerRadius: 16, style: .continuous)
								.foregroundStyle(Color.gray.opacity(0.1))
								.overlay(content: {
									RoundedRectangle(cornerRadius: 16, style: .continuous)
										.stroke(lineWidth: 1 / 3)
										.foregroundStyle(Color.gray.opacity(0.4))
								})
						)
						.contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
						#if os(iOS)
							.contentShape(
								.contextMenuPreview,
								RoundedRectangle(cornerRadius: 16, style: .continuous)
							)
						#endif
							.contextMenu(ContextMenu(menuItems: {
								Button("Copy Name") {
									#if os(iOS)
									UIPasteboard.general.string = "\(icon)"
									#else
									NSPasteboard.general.clearContents()
									NSPasteboard.general.setString("\(icon)", forType: .string)
									#endif
								}
							}))
					}
				}
			}
		}
		#if os(iOS)
		.padding(.top, 4)
		#else
		.padding(.top)
		#endif
	}
}

// MARK: - FluentIcon.Regular + Identifiable

extension FluentIcon.Regular: Identifiable {
	public var id: String { "regular-\(rawValue)" }
}

// MARK: - FluentIcon.Filled + Identifiable

extension FluentIcon.Filled: Identifiable {
	public var id: String { "filled-\(rawValue)" }
}

// MARK: - FluentIcon.Light + Identifiable

extension FluentIcon.Light: Identifiable {
	public var id: String { "light-\(rawValue)" }
}

// MARK: - FluentIcon.Resizable + Identifiable

extension FluentIcon.Resizable: Identifiable {
	public var id: String { "resizable-\(rawValue)" }
}

#Preview("Fluent Icon") {
	NavigationStack {
		ContentView()
	}
	#if os(macOS)
	.frame(width: 800 / 1.414, height: 800)
	#endif
}
