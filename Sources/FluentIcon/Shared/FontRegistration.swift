import CoreGraphics
import CoreText
import Foundation

enum FontRegistration {
	fileprivate static let registration = Registration()

	internal static func registerFonts(from bundle: Bundle? = nil) {
		#if SWIFT_PACKAGE
		let fontBundle = bundle ?? Bundle.module
		#else
		let fontBundle = bundle ?? Bundle(for: Self.self)
		#endif

		registration.doRegister {
			FluentIconFont.allCases.forEach { font in
				registerFont(bundle: fontBundle, fontName: font.file, fontExtension: "ttf")
			}
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

extension FontRegistration {
	fileprivate final class Registration: @unchecked Sendable {
		private let lock: UnfairLock = .init()
		private(set) var isRegistered = false

		func doRegister(_ operation: () -> Void) {
			guard !isRegistered else { return }
			lock.around {
				guard !isRegistered else { return }
				operation()
				isRegistered = true
			}
		}
	}

	final class UnfairLock {
		private let unfairLock: os_unfair_lock_t

		init() {
			self.unfairLock = .allocate(capacity: 1)
			unfairLock.initialize(to: os_unfair_lock())
		}

		deinit {
			unfairLock.deinitialize(count: 1)
			unfairLock.deallocate()
		}

		@discardableResult
		func around<T>(_ closure: () throws -> T) rethrows -> T {
			lock(); defer { unlock() }
			return try closure()
		}

		func around(_ closure: () throws -> Void) rethrows {
			lock(); defer { unlock() }
			return try closure()
		}

		private func lock() {
			os_unfair_lock_lock(unfairLock)
		}

		private func unlock() {
			os_unfair_lock_unlock(unfairLock)
		}
	}
}
