import SwiftUI
import FluentIcon

struct ContentView: View {
	var body: some View {
		VStack {
			FluentIcon.globeAdd20Filled.image
				.size(70)
			Text("Hello, world!")
		}
		.padding()
	}
}

#Preview {
	ContentView()
}
