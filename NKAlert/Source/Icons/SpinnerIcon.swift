//
//  SpinnerIcon.swift
//  NKAlert
//
//  Created by Nelkit Chavez on 30/3/18.
//  Copyright © 2018 Chakalon Company. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class SpinnerIcon : UIView {
    let circleLayer = CAShapeLayer()
    var circleAnimation = CABasicAnimation(keyPath: "transform.rotation")
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        drawShapeLayer()
    }
    
    convenience public init(frame:CGRect, colors: UIColor...) {
        self.init(frame: frame)
        self.frame = frame
        drawShapeLayer()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        drawShapeLayer()
    }
    
    func drawShapeLayer() {
        //// circle Drawing
        let circle = drawCircle()
        circleLayer.path = circle.cgPath
        circleLayer.lineWidth = 8
        circleLayer.bounds = CGRect(x: 0, y: 0, width: 90, height: 90)
        circleLayer.position = CGPoint(x: 45, y: 45)
        
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [Colors.spinner.cgColor, Colors.spinner.cgColor, Colors.spinner.cgColor]
        gradient.locations = [0, 0.41, 0.71]
        gradient.startPoint = CGPoint(x: 145.82, y: 90.82)
        gradient.endPoint = CGPoint(x: 82.18, y: 27.18)
        gradient.mask = circleLayer
        self.layer.addSublayer(gradient)
        
        
        circleAnimation.duration = 1
        circleAnimation.byValue = NSNumber(value: 2*Double.pi as Double)
        circleAnimation.repeatCount = Float.infinity
        
        circleLayer.add(circleAnimation, forKey: "circleAnimation")
        
    }
    
    func drawCircle() -> UIBezierPath {
        let shapePath = UIBezierPath()
        shapePath.move(to: CGPoint(x: 45, y: 90))
        shapePath.addCurve(to: CGPoint(x: 13.18, y: 76.82), controlPoint1: CGPoint(x: 32.98, y: 90), controlPoint2: CGPoint(x: 21.68, y: 85.32))
        shapePath.addCurve(to: CGPoint(x: 0, y: 45), controlPoint1: CGPoint(x: 4.68, y: 68.32), controlPoint2: CGPoint(x: 0, y: 57.02))
        shapePath.addCurve(to: CGPoint(x: 13.18, y: 13.18), controlPoint1: CGPoint(x: 0, y: 32.98), controlPoint2: CGPoint(x: 4.68, y: 21.68))
        shapePath.addCurve(to: CGPoint(x: 45, y: 0), controlPoint1: CGPoint(x: 21.68, y: 4.68), controlPoint2: CGPoint(x: 32.98, y: 0))
        shapePath.addCurve(to: CGPoint(x: 76.82, y: 13.18), controlPoint1: CGPoint(x: 57.02, y: 0), controlPoint2: CGPoint(x: 68.32, y: 4.68))
        shapePath.addCurve(to: CGPoint(x: 90, y: 45), controlPoint1: CGPoint(x: 85.32, y: 21.68), controlPoint2: CGPoint(x: 90, y: 32.98))
        shapePath.addCurve(to: CGPoint(x: 82.38, y: 69.98), controlPoint1: CGPoint(x: 90, y: 53.88), controlPoint2: CGPoint(x: 87.36, y: 62.52))
        shapePath.addCurve(to: CGPoint(x: 77.5, y: 70.95), controlPoint1: CGPoint(x: 81.3, y: 71.6), controlPoint2: CGPoint(x: 79.11, y: 72.03))
        shapePath.addCurve(to: CGPoint(x: 76.53, y: 66.07), controlPoint1: CGPoint(x: 75.89, y: 69.87), controlPoint2: CGPoint(x: 75.45, y: 67.69))
        shapePath.addCurve(to: CGPoint(x: 82.97, y: 45), controlPoint1: CGPoint(x: 80.74, y: 59.77), controlPoint2: CGPoint(x: 82.97, y: 52.49))
        shapePath.addCurve(to: CGPoint(x: 45, y: 7.03), controlPoint1: CGPoint(x: 82.97, y: 24.06), controlPoint2: CGPoint(x: 65.94, y: 7.03))
        shapePath.addCurve(to: CGPoint(x: 7.03, y: 45), controlPoint1: CGPoint(x: 24.06, y: 7.03), controlPoint2: CGPoint(x: 7.03, y: 24.06))
        shapePath.addCurve(to: CGPoint(x: 45, y: 82.97), controlPoint1: CGPoint(x: 7.03, y: 65.94), controlPoint2: CGPoint(x: 24.06, y: 82.97))
        shapePath.addCurve(to: CGPoint(x: 64.64, y: 77.5), controlPoint1: CGPoint(x: 51.94, y: 82.97), controlPoint2: CGPoint(x: 58.74, y: 81.08))
        shapePath.addCurve(to: CGPoint(x: 69.47, y: 78.69), controlPoint1: CGPoint(x: 66.3, y: 76.49), controlPoint2: CGPoint(x: 68.46, y: 77.03))
        shapePath.addCurve(to: CGPoint(x: 68.28, y: 83.51), controlPoint1: CGPoint(x: 70.48, y: 80.35), controlPoint2: CGPoint(x: 69.94, y: 82.51))
        shapePath.addCurve(to: CGPoint(x: 45, y: 90), controlPoint1: CGPoint(x: 61.28, y: 87.76), controlPoint2: CGPoint(x: 53.23, y: 90))
        shapePath.close()
        return shapePath
    }
    
}

