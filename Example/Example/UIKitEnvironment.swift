#if canImport(UIKit)
import FluentIcon
import UIKit

final class UIKitEnvironmentViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		let image = FluentIcon.Filled.sparkle48.asImage()
		let imageView = UIImageView(image: image)
		view.addSubview(imageView)
		imageView.frame.size = CGSize(width: 100, height: 100)
		imageView.tintColor = .systemMint
		imageView.center = view.center

		let barImage = FluentIcon.Filled.sparkle48.asImage(size: 33)
		let barItem = UIBarButtonItem(image: barImage)
		navigationItem.leftBarButtonItem = barItem

		title = "UIKit Environment"
	}
}

#if canImport(SwiftUI)
import SwiftUI
#endif
#Preview {
	let vc = UIKitEnvironmentViewController()
	return UINavigationController(rootViewController: vc)
}
#endif
