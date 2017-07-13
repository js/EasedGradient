//
//  ViewController.swift
//  EasedGradient-Example
//
//  Created by Johan Sørensen on 13/07/2017.
//  Copyright © 2017 Johan Sørensen. All rights reserved.
//

import UIKit
import EasedGradient

class ViewController: UIViewController {
    let scrollView = UIScrollView(frame: .zero)
    let gradientViewHeight: CGFloat = 64

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)

        let gradientViews = makeGradientViews()
        for (v, index) in zip(gradientViews, gradientViews.indices) {
            v.frame.origin.y = CGFloat(index) * gradientViewHeight
            scrollView.addSubview(v)
        }
        scrollView.contentSize = CGSize(width: view.frame.width, height: CGFloat(gradientViews.count) * gradientViewHeight)
    }

    private func makeGradientViews() -> [UIView] {
        let curves: [(EasingCurve, String)] = [
            (.linear, "linear"),
            (.easeIn, "easeIn"),
            (.easeOut, "easeOut"),
            (.easeInOut, "easeInOut"),
            (.custom(function: { $0 > 0.7 ? 1 : 0}), "custom"),
        ]
        return curves.map { (curve, name) in
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.gradientViewHeight))

            let gradient = UIColor.green.gradient(to: .orange, stops: 32, using: curve)
            let easedGradientLayer = CAGradientLayer()
            easedGradientLayer.colors = gradient.colors
            easedGradientLayer.locations = gradient.locations as [NSNumber]
            easedGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            easedGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            view.layer.addSublayer(easedGradientLayer)
            easedGradientLayer.frame = view.bounds

            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
            label.textAlignment = .center
            label.text = name
            view.addSubview(label)

            return view
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
}

