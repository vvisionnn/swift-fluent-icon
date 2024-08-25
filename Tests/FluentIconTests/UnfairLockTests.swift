@testable import FluentIcon
import XCTest

final class UnfairLockTests: XCTestCase {
	typealias UnfairLock = FontRegistration.UnfairLock

	func testAroundReturnsValue() throws {
		let lock = UnfairLock()
		let result = lock.around {
			42
		}
		XCTAssertEqual(result, 42)
	}

	func testAroundThrowsError() {
		enum TestError: Error { case failure }
		let lock = UnfairLock()
		XCTAssertThrowsError(try lock.around {
			throw TestError.failure
		}) { error in
			XCTAssertEqual(error as? TestError, TestError.failure)
		}
	}

	func testAroundExecutesClosure() throws {
		let lock = UnfairLock()
		var executed = false
		lock.around {
			executed = true
		}
		XCTAssertTrue(executed)
	}

	func testAroundVoidThrowsError() {
		enum TestError: Error { case failure }
		let lock = UnfairLock()
		XCTAssertThrowsError(try lock.around {
			throw TestError.failure
		}) { error in
			XCTAssertEqual(error as? TestError, TestError.failure)
		}
	}

	func testLockUnlockMechanism() {
		let lock = UnfairLock()
		var counter = 0
		let roundCount = 999

		DispatchQueue.concurrentPerform(iterations: roundCount) { _ in
			lock.around {
				counter += 1
			}
		}

		XCTAssertEqual(counter, roundCount)
	}
}
