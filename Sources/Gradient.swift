//
//  Gradient.swift
//  EasedGradient
//
//  Created by Johan Sørensen on 13/07/2017.
//  Copyright © 2017 Johan Sørensen. All rights reserved.
//

import UIKit

public extension UIColor {
    public func mix(with other: UIColor, ratio: CGFloat) -> UIColor {
        guard other != self else { return self }

        // TODO: convert to a common colorspace first?

        guard let components = cgColor.components else { return self }
        guard let otherComponents = other.cgColor.components else { return self }

        let clampedRatio = ratio.clamped(to: 0...1)
        let interpolatedComponents = zip(components, otherComponents).map { (a, b) -> CGFloat in
            return (a * (1.0 - clampedRatio)) + (b * clampedRatio)
        }

        let colorspace = cgColor.colorSpace ?? CGColorSpaceCreateDeviceRGB()
        if let interpolated = CGColor(colorSpace: colorspace, components: interpolatedComponents) {
            return UIColor(cgColor: interpolated)
        }

        return self
    }
}

public struct Gradient {
    public let colors: [CGColor]
    public let locations: [CGFloat]

    public init(from: UIColor, to other: UIColor, stops: Int, using curve: EasingCurve) {
        guard stops > 2 else {
            self.colors = [from, other].map({ $0.cgColor })
            self.locations = [0.0, 1.0]
            return
        }

        let colorsAndStops: [(CGColor, CGFloat)] = (0..<stops).map { stop in
            let location = CGFloat(stop) / CGFloat(stops)
            let ratio = curve.value(for: location)
            let mixedColor = from.mix(with: other, ratio: ratio)
            return (mixedColor.cgColor, location)
        }

        self.colors = colorsAndStops.map({ $0.0 })
        self.locations = colorsAndStops.map({ $0.1 })
    }
}
