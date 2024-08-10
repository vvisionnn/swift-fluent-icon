import FluentIcon
import SwiftUI

struct SwiftUIEnvironmentView: View {
	var body: some View {
		TabView {
			NavigationStack {
				List {
					HStack {
						FluentIcon.Filled.star48.image
							.size(24)
						Image(systemName: "star.fill")
							.font(.system(size: 20))
					}
				}
				.toolbar(content: {
					#if os(iOS)
					ToolbarItemGroup(placement: .topBarLeading) {
						HStack {
							FluentIcon.Filled.sparkle48.image
							Image(systemName: "sparkles")
							Text("Default")
								.font(.headline)
						}
					}

					ToolbarItemGroup(placement: .topBarTrailing) {
						HStack {
							FluentIcon.Filled.sparkle48.image
							Image(systemName: "sparkles")
							Text("Tinted")
								.font(.headline)
						}
						.foregroundStyle(Color.mint)
					}
					#else
					ToolbarItemGroup(placement: .primaryAction) {
						HStack {
							FluentIcon.Filled.sparkle48.image
							Image(systemName: "sparkles")
							Text("Default")
								.font(.headline)
						}
					}

					ToolbarItemGroup(placement: .secondaryAction) {
						HStack {
							FluentIcon.Filled.sparkle48.image
							Image(systemName: "sparkles")
							Text("Tinted")
								.font(.headline)
						}
						.foregroundStyle(Color.mint)
					}
					#endif
				})
			}
			.tabItem {
				FluentIcon.Filled.weatherHaze48.image
					.size(28)
				Text("Fluent Default")
			}

			Rectangle()
				.fill(Color.clear)
				.tabItem {
					Image(systemName: "sparkles")
					Text("Fluent Default")
				}
		}
	}
}

#Preview {
	SwiftUIEnvironmentView()
}
