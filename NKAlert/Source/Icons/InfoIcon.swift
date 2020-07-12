//
//  InfoIcon.swift
//  NKAlert
//
//  Created by Nelkit Chavez on 3/27/19.
//  Copyright © 2018 Chakalon Company. All rights reserved.
//
import Foundation
import UIKit

@IBDesignable
public class InfoIcon : UIView {
    let circleLayer = CAShapeLayer()
    var circleAnimation = CABasicAnimation(keyPath: "strokeEnd")
    var opacityAnimation = CABasicAnimation(keyPath: "opacity")
    
    let lineLayer = CAShapeLayer()
    let pointLayer = CAShapeLayer()
    var lineAnimation = CABasicAnimation(keyPath: "strokeEnd")
    var pointAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
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
    
    @IBInspectable var color: UIColor = Colors.info
    
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
        
        
        //// line Drawing
        let line = drawLine()
        lineLayer.path = line.cgPath
        lineLayer.strokeColor = color.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineWidth = 10
        lineLayer.strokeEnd = 0
        lineLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        lineLayer.lineJoin = CAShapeLayerLineJoin(rawValue: "round")
        self.layer.addSublayer(lineLayer)

        lineAnimation.duration = animationTime
        lineAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        lineAnimation.fillMode = CAMediaTimingFillMode.forwards
        lineAnimation.isRemovedOnCompletion = false
        lineAnimation.fromValue = 0
        lineAnimation.toValue = 1
        lineAnimation.beginTime = CACurrentMediaTime() + animationDelay
        lineLayer.add(lineAnimation, forKey: "lineAnimation")
        
        //// point Drawing
        let point = drawPoint()
        pointLayer.path = point.cgPath
        pointLayer.strokeColor = color.cgColor
        pointLayer.fillColor = UIColor.clear.cgColor
        pointLayer.lineWidth = 10
        pointLayer.strokeEnd = 0
        pointLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        pointLayer.lineJoin = CAShapeLayerLineJoin(rawValue: "round")
        self.layer.addSublayer(pointLayer)
        
        pointAnimation.duration = animationTime
        pointAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pointAnimation.fillMode = CAMediaTimingFillMode.forwards
        pointAnimation.isRemovedOnCompletion = false
        pointAnimation.fromValue = 0
        pointAnimation.toValue = 1
        pointAnimation.beginTime = CACurrentMediaTime() + (animationDelay*2)
        pointLayer.add(pointAnimation, forKey: "pointAnimation")
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
    
    func drawLine() -> UIBezierPath {
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 44.5, y: 35))
        linePath.addCurve(to: CGPoint(x: 44.5, y: 72.5), controlPoint1: CGPoint(x: 44.5, y: 35.76), controlPoint2: CGPoint(x: 44.5, y: 72.5))
        color.setStroke()
        linePath.lineWidth = 10
        linePath.lineCapStyle = .round
        linePath.stroke()
        return linePath
    }
    
    func drawPoint() -> UIBezierPath {
        let pointPath = UIBezierPath()
        pointPath.move(to: CGPoint(x: 44.5, y: 20))
        pointPath.addCurve(to: CGPoint(x: 44.5, y: 19.5), controlPoint1: CGPoint(x: 44.5, y: 19.99), controlPoint2: CGPoint(x: 44.5, y: 19.5))
        color.setStroke()
        pointPath.lineWidth = 10
        pointPath.lineCapStyle = .round
        pointPath.stroke()
        return pointPath
    }
    
}
