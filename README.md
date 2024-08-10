# Swift Fluent Icon

[![Build](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/build.yml/badge.svg)](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/build.yml)
[![Release](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/release.yml/badge.svg)](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/release.yml)
[![Test](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/test.yml/badge.svg)](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/test.yml)
[![Format](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/format.yml/badge.svg)](https://github.com/vvisionnn/swift-fluent-icon/actions/workflows/format.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fvvisionnn%2Fswift-fluent-icon%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/vvisionnn/swift-fluent-icon)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fvvisionnn%2Fswift-fluent-icon%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/vvisionnn/swift-fluent-icon)

> [!WARNING]  
> `swift-fluent-icon` is currently work in progress

> [!IMPORTANT]  
> highly inspired by [Font Awesome](https://fontawesome.com/) and [LiveUI/Awesome](https://github.com/LiveUI/Awesome)

A awesome swift library for packaging [fluent icon](https://github.com/microsoft/fluentui-system-icons) into you app without any costs, no need to delete unused resources just use like SF Symbol but type safe, with nearly no build time increase compare to the original method provided by fluent icon team

## Installation

You can add `FluentIcon` to an Xcode project by adding it to your project as a package.

> https://github.com/vvisionnn/swift-fluent-icon

If you want to use FluentIcon in a [SwiftPM](https://swift.org/package-manager/) project, it's as
simple as adding it to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/vvisionnn/swift-fluent-icon", from: "<any-version-released>")
]
```

And then adding the product to any target that needs access to the library:

```swift
.product(name: "FluentIcon", package: "swift-fluent-icon"),
```

## Quick Start
```swift
// SwiftUI usage
FluentIcon.Filled.sparkle48.image
  .size(<size-you-want>)

// UIKit/AppKit Usage
UIImageView(image: FluentIcon.Filled.sparkle48.asImage())
NSImageView(image: FluentIcon.Filled.sparkle48.asImage())
```

## More Examples
> Please check [Example](https://github.com/vvisionnn/swift-fluent-icon/tree/master/Example) folder or clone then open the `FluentIcon.xcworkspace`

## Alternatives

There are many other icon libraries in the Swift community. Here are a few well-known examples:

  * [Microsoft Official Fluent System Icon](https://github.com/microsoft/fluentui-system-icons)
  * [Font Awesome](https://github.com/LiveUI/Awesome)

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
