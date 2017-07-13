//
//  Gradient.swift
//  EasedGradient
//
//  Created by Johan Sørensen on 13/07/2017.
//  Copyright © 2017 Johan Sørensen. All rights reserved.
//

import UIKit


extension UIColor {
    func mix(with other: UIColor, ratio: CGFloat) -> UIColor {
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

    struct Gradient {
        let colors: [CGColor]
        let locations: [CGFloat]
        // TODO be a Generator?
    }

    func gradient(to other: UIColor, stops: Int) -> Gradient {
        return gradient(to: other, stops: stops, using: .linear)
    }

    func gradient(to other: UIColor, stops: Int, using curve: EasingCurve) -> Gradient {
        guard stops > 2 else {
            return Gradient(colors: [self, other].map({ $0.cgColor }), locations: [0.0, 1.0])
        }

        let colorsAndStops: [(CGColor, CGFloat)] = (0..<stops).map { stop in
            let location = CGFloat(stop) / CGFloat(stops)
            let ratio = curve.value(for: location)
            let mixedColor = self.mix(with: other, ratio: ratio)
            return (mixedColor.cgColor, location)
        }

        return Gradient(colors: colorsAndStops.map({ $0.0 }), locations: colorsAndStops.map({ $0.1 }))
    }
}
