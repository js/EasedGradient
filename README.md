# EasedGradient

A tiny library for creating eased gradients.

## Eased gradient

An eased gradient is simply a gradient rendered using an easing curve, such as "ease in" or "ease in-out". by using Easedgradient you can avoid the [Mach Bands optical illusion](https://en.wikipedia.org/wiki/Mach_bands) which is particular visible when the gradient moves over a background such as an image in a parallax manner. Build and run the "EasedGradient-Example" scheme to see the effect when dragging the scrollview around.

![screenshot](https://github.com/js/EasedGradient/raw/master/EasedGradient-Example/screenshot.png)

## Usage

```swift
let gradient = UIColor.blue.gradient(to: .red, stops: 32, using: .easeInOut)

let gradientLayer = CAGradientLayer()
gradientLayer.colors = gradient.colors
gradientLayer.locations = gradient.locations as [NSNumber]
// add the gradientLayer as a sublayer or whatever
```

## Installation

EasedGradient is available as a CocoaPod (`pod 'EasedGradient'`) and the Swift Package Manager. Framework installation is also available by dragging the EasedGradient.xcodeproj into your project or via Carthage.

Eventually has no dependencies outside of UIKit and CoreGraphics

## License

MIT, See the LICENSE file
