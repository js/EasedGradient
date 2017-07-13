//
//  EasingCurve.swift
//  EasedGradient
//
//  Created by Johan Sørensen on 13/07/2017.
//  Copyright © 2017 Johan Sørensen. All rights reserved.
//

import Foundation
import CoreGraphics

public enum EasingCurve {
    case linear
    case easeIn
    case easeOut
    case easeInOut
    case custom(function: (CGFloat) -> CGFloat)

    public func value(for progress: CGFloat) -> CGFloat {
        let p = progress.clamped(to: 0...1)
        switch self {
        case .linear:
            return p
        case .easeIn:
            return pow(p, 2.0)
        case .easeOut:
            return 1.0 - pow(p - 1.0, 2.0)
        case .easeInOut:
            return 0.5 * (1.0 - cos(p * CGFloat.pi))
        case .custom(let easingFunction):
            return easingFunction(p)
        }
    }
}
