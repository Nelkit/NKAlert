//
//  SuccessIcon.swift
//  NKAlert
//
//  Created by Nelkit Chavez on 30/3/18.
//  Copyright © 2018 Chakalon Company. All rights reserved.
//
import Foundation
import UIKit

@IBDesignable
public class SuccessIcon : UIView {
   
    let circleLayer = CAShapeLayer()
    var circleAnimation = CABasicAnimation(keyPath: "strokeEnd")
    var opacityAnimation = CABasicAnimation(keyPath: "opacity")
    
    let checkLayer = CAShapeLayer()
    var checkAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    
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
    
    @IBInspectable var color: UIColor = Colors.success
    
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
        
        
        //// check Drawing
        let check = drawCheckIcon()
        checkLayer.path = check.cgPath
        checkLayer.strokeColor = color.cgColor
        checkLayer.fillColor = UIColor.clear.cgColor
        checkLayer.lineWidth = 10
        checkLayer.strokeEnd = 0
        checkLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        checkLayer.lineJoin = CAShapeLayerLineJoin(rawValue: "round")
        self.layer.addSublayer(checkLayer)
        
        checkAnimation.duration = animationTime
        checkAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        checkAnimation.fillMode = CAMediaTimingFillMode.forwards
        checkAnimation.isRemovedOnCompletion = false
        checkAnimation.fromValue = 0
        checkAnimation.toValue = 1
        checkAnimation.beginTime = CACurrentMediaTime() + animationDelay
        checkLayer.add(checkAnimation, forKey: "checkAnimation")
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
    
    func drawCheckIcon() -> UIBezierPath {
        let checkPath = UIBezierPath()
        checkPath.move(to: CGPoint(x: 16, y: 46.13))
        checkPath.addLine(to: CGPoint(x: 34.4, y: 64))
        checkPath.addLine(to: CGPoint(x: 69, y: 29))
        color.setStroke()
        checkPath.lineWidth = 10
        checkPath.lineCapStyle = .round
        checkPath.lineJoinStyle = .round
        checkPath.stroke()
        return checkPath
    }

}
