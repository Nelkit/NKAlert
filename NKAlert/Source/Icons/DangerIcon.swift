//
//  DangerIcon.swift
//  NKAlert
//
//  Created by Nelkit Chavez on 30/3/18.
//  Copyright © 2018 Chakalon Company. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class DangerIcon : UIView {
    let circleLayer = CAShapeLayer()
    var circleAnimation = CABasicAnimation(keyPath: "strokeEnd")
    var opacityAnimation = CABasicAnimation(keyPath: "opacity")
    
    let line1Layer = CAShapeLayer()
    let line2Layer = CAShapeLayer()
    var strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    convenience public init(frame:CGRect,animationTime:Double,animationDelay:Double) {
        self.init(frame: frame)
        self.frame = frame
        drawShapeLayer(animationTime:animationTime,animationDelay:animationDelay)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBInspectable var color: UIColor = Colors.danger
    
    func drawShapeLayer(animationTime:Double,animationDelay:Double) {
        
        //// circle Drawing
        let circle = drawCircle()
        circleLayer.path = circle.cgPath
        circleLayer.strokeColor = color.cgColor
        circleLayer.lineWidth = 8
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeEnd = 0
        self.layer.addSublayer(circleLayer)
        
        circleAnimation.duration = animationTime
        circleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        circleAnimation.fillMode = CAMediaTimingFillMode.forwards
        circleAnimation.isRemovedOnCompletion = false
        circleAnimation.fromValue = 0
        circleAnimation.toValue = 1
        circleAnimation.beginTime = CACurrentMediaTime() + animationDelay
        
        opacityAnimation.duration = animationTime
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        opacityAnimation.fillMode = CAMediaTimingFillMode.forwards
        opacityAnimation.isRemovedOnCompletion = false
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.beginTime = CACurrentMediaTime() + (animationDelay*2)
        
        circleLayer.add(circleAnimation, forKey: "circleAnimation")
        circleLayer.add(opacityAnimation, forKey: "opacityAnimation")
        
        
        //// line1 Drawing
        let line1 = drawLine1()
        line1Layer.path = line1.cgPath
        line1Layer.strokeColor = color.cgColor
        line1Layer.fillColor = UIColor.clear.cgColor
        line1Layer.strokeEnd = 0
        line1Layer.lineWidth = 10
        line1Layer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        line1Layer.lineJoin = CAShapeLayerLineJoin(rawValue: "round")
        self.layer.addSublayer(line1Layer)
        
        strokeAnimation.duration = animationTime
        strokeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        strokeAnimation.fillMode = CAMediaTimingFillMode.forwards
        strokeAnimation.isRemovedOnCompletion = false
        strokeAnimation.fromValue = 0
        strokeAnimation.toValue = 1
        strokeAnimation.beginTime = CACurrentMediaTime() + animationDelay
        line1Layer.add(strokeAnimation, forKey: "strokeAnimation")
        
        //// line2 Drawing
        let line2 = drawLine2()
        line2Layer.path = line2.cgPath
        line2Layer.strokeColor = color.cgColor
        line2Layer.fillColor = UIColor.clear.cgColor
        line2Layer.strokeEnd = 0
        line2Layer.lineWidth = 10
        line2Layer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        line2Layer.lineJoin = CAShapeLayerLineJoin(rawValue: "round")
        self.layer.addSublayer(line2Layer)

        line2Layer.add(strokeAnimation, forKey: "strokeAnimation")
    }
    
    func drawCircle() -> UIBezierPath {
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 90, height: 90))
        UIColor.white.setFill()
        circlePath.fill()
        color.setStroke()
        circlePath.lineWidth = 8
        circlePath.stroke()
        return circlePath
    }

    func drawLine1() -> UIBezierPath {
        let line1Path = UIBezierPath()
        line1Path.move(to: CGPoint(x: 29, y: 29))
        line1Path.addCurve(to: CGPoint(x: 62.5, y: 64.5), controlPoint1: CGPoint(x: 29, y: 29.76), controlPoint2: CGPoint(x: 62.5, y: 64.5))
        UIColor.red.setStroke()
        line1Path.lineWidth = 10
        line1Path.lineCapStyle = .round
        line1Path.stroke()
        return line1Path
    }
    
    func drawLine2() -> UIBezierPath {
        let line2Path = UIBezierPath()
        line2Path.move(to: CGPoint(x: 63, y: 29))
        line2Path.addCurve(to: CGPoint(x: 29.5, y: 64.5), controlPoint1: CGPoint(x: 63, y: 29.76), controlPoint2: CGPoint(x: 29.5, y: 64.5))
        UIColor.red.setStroke()
        line2Path.lineWidth = 10
        line2Path.lineCapStyle = .round
        line2Path.stroke()
        return line2Path
    }

}
