import FluentIcon
import SwiftUI

struct ContentView: View {
	var body: some View {
		GeometryReader { proxy in
			ScrollView {
				let spacing = 8
				let fullWidth = proxy.size.width
				let columnCount = Int(Double(fullWidth) / 100)
				let columnWidth = (fullWidth - CGFloat(columnCount + 3) * CGFloat(spacing)) / CGFloat(columnCount)

				LazyVGrid(
					columns: Array(
						repeating: GridItem(
							.fixed(columnWidth),
							spacing: CGFloat(spacing)
						),
						count: columnCount
					)
				) {
					ForEach(FluentIcon.allCases) { icon in
						icon.image
							.size(columnWidth - 20)
							.frame(width: columnWidth, height: columnWidth)
							.background(
								RoundedRectangle(cornerRadius: 16, style: .continuous)
									.foregroundStyle(Color(uiColor: .secondarySystemBackground))
									.overlay(content: {
										RoundedRectangle(cornerRadius: 16, style: .continuous)
											.stroke(lineWidth: 1 / 3)
											.foregroundStyle(Color(uiColor: .separator))
									})
							)
					}
				}
			}
		}
	}
}

extension FluentIcon: Identifiable {
	public var id: String { rawValue }
}

#Preview {
	ContentView()
}
