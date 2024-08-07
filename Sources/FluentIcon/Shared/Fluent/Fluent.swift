import Foundation

public protocol Fluent: RawRepresentable, Hashable, CaseIterable where RawValue == String {}

extension FluentIcon: Fluent {}
