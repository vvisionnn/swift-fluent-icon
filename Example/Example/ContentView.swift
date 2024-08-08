import FluentIcon
import SwiftUI

struct ContentView: View {
	var body: some View {
		GeometryReader { proxy in
			ScrollView {
				let spacing = 8
				let fullWidth = proxy.size.width
				let columnCount = Int(Double(fullWidth) / 150)
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
						VStack(spacing: 0) {
							icon.image
								.size(columnWidth - 40)
								.frame(width: columnWidth, height: columnWidth)
							
							Text("\(icon)")
								.font(.caption)
								.lineLimit(1)
								.padding(.horizontal, 4)
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
					}
				}
				.padding(.vertical)
			}
			.navigationTitle("Fluent Icon")
		}
	}
}

extension FluentIcon: Identifiable {
	public var id: String { rawValue }
}

#Preview("Fluent Icon") {
	NavigationStack {
		ContentView()
	}
	.frame(height: 800)
	.previewDisplayName("Fluent Icon")
}
