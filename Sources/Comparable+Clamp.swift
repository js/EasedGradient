//
//  Clamp.swift
//  EasedGradient
//
//  Created by Johan Sørensen on 13/07/2017.
//  Copyright © 2017 Johan Sørensen. All rights reserved.
//

import Foundation

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        if self > range.upperBound {
            return range.upperBound
        } else if self < range.lowerBound {
            return range.lowerBound
        } else {
            return self
        }
    }
}
