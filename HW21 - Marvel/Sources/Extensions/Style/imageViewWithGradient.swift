//
//  imageViewWithGradient.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 06.11.2022.
//

import UIKit

final class ImageViewWithGradient: UIImageView {
    let myGradientLayer: CAGradientLayer

    override init(frame: CGRect) {
        myGradientLayer = CAGradientLayer()
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        myGradientLayer = CAGradientLayer()
        super.init(coder: aDecoder)
        self.setup()
    }

    func setup() {
        myGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        myGradientLayer.endPoint = CGPoint(x: 0, y: 1)
        let colors: [CGColor] = [
            UIColor.white.withAlphaComponent(0.4).cgColor,
            UIColor.white.withAlphaComponent(0.5).cgColor,
            UIColor.white.withAlphaComponent(0.7).cgColor,
            UIColor.white.withAlphaComponent(0.9).cgColor,
            UIColor.white.withAlphaComponent(1.0).cgColor,
        ]
        myGradientLayer.colors = colors
        myGradientLayer.isOpaque = false
        self.layer.addSublayer(myGradientLayer)
    }

    override func layoutSubviews() {
        myGradientLayer.frame = self.layer.bounds
    }
}
