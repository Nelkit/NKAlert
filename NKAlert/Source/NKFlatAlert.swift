//
//  NKFlatAlert.swift
//  NKFlatAlert
//
//  Created by Nelkit Chavez on 1/4/18.
//

import Foundation
import UIKit

public enum AlertStyle {
    case WARNING, SUCCESS, DANGER, INFO, INDICATOR
}

public class NKFlatAlert: UIView, Modal {
    var backgroundView = UIView()
    var dialogView = UIView()
    var iconView = UIView()
    var titleView = UILabel()
    var descriptionView = UILabel()
    var bottomContainerView = UIView()
    var containerButttons = UIStackView()
    var orientationListenerWasAdded: Bool = false
    let displayedOnCompactDevice = UIDevice.current.userInterfaceIdiom == .phone
    
    var okButtonView = MaterialButton(type: .system)
    var cancelButtonView = MaterialButton(type: .system)
    
    public convenience init(title:String, description:String, style:AlertStyle) {
        
        self.init(frame: UIScreen.main.bounds)
        initialize(title: title, style:style)
        descriptionView.text = description
    }
    
    public convenience init(title:String, description:NSMutableAttributedString, style:AlertStyle) {
        self.init(frame: UIScreen.main.bounds)
        initialize(title: title, style:style)
        descriptionView.attributedText = description
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show(animated:Bool){
        showModal(animated: animated)
    }
    
    
    func initialize(title:String, style:AlertStyle){
        okButtonView.elevate = 1
        cancelButtonView.elevate = 1
        removeAutoConstraintsFromView(vs: [dialogView, backgroundView,iconView,titleView,descriptionView,bottomContainerView, okButtonView,cancelButtonView, containerButttons])
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        if(!orientationListenerWasAdded){
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.onOrientationChanged),
                name: .UIDeviceOrientationDidChange,
                object: nil
            )
            orientationListenerWasAdded = true
        }
        addSubview(backgroundView)
        
        dialogView.frame.origin = CGPoint(x: UIScreen.main.bounds.width/2, y: 0)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 8
        addSubview(dialogView)
        dialogView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dialogView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        if UIDevice.current.orientation.isLandscape {
            dialogView.widthAnchor.constraint(equalTo: widthAnchor, multiplier:0.5).isActive = true
        }else{
            dialogView.widthAnchor.constraint(equalTo: widthAnchor, multiplier:0.8).isActive = true
        }
        
        dialogView.addSubview(iconView)
        iconView.backgroundColor = .white
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: dialogView.topAnchor, constant: 20).isActive = true
        iconView.widthAnchor.constraint(equalToConstant:90).isActive = true
        iconView.heightAnchor.constraint(equalToConstant:90).isActive = true
        
        dialogView.addSubview(titleView)
        titleView.text = title.uppercased()
        titleView.textAlignment = .center
        titleView.numberOfLines = 0
        titleView.textColor = Constants.Colors.PrimaryText
        titleView.font = UIFont.boldSystemFont(ofSize: 18)
        titleView.leadingAnchor.constraint(
            equalTo: dialogView.leadingAnchor,
            constant:Constants.UI.staticMarginBox
            ).isActive = true
        titleView.trailingAnchor.constraint(
            equalTo: dialogView.trailingAnchor,
            constant:-Constants.UI.staticMarginBox
            ).isActive = true
        titleView.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10).isActive = true
        
        dialogView.addSubview(descriptionView)
        descriptionView.textAlignment = .center
        descriptionView.numberOfLines = 0
        descriptionView.textColor = Constants.Colors.SecondaryText
        descriptionView.font = UIFont.systemFont(ofSize: 14)
        descriptionView.leadingAnchor.constraint(
            equalTo: dialogView.leadingAnchor,
            constant:Constants.UI.staticMarginBox
            ).isActive = true
        descriptionView.trailingAnchor.constraint(
            equalTo: dialogView.trailingAnchor,
            constant:-Constants.UI.staticMarginBox
            ).isActive = true
        descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        
        dialogView.addSubview(bottomContainerView)
        bottomContainerView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant:10).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor, constant:-10).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor).isActive = true
        
        bottomContainerView.addSubview(containerButttons)
        containerButttons.axis = .horizontal
        containerButttons.distribution = .fillEqually
        containerButttons.alignment = .center
        containerButttons.spacing = 10
        containerButttons.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant:10).isActive = true
        containerButttons.trailingAnchor.constraint(equalTo:bottomContainerView.trailingAnchor, constant:-10).isActive = true
        containerButttons.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        containerButttons.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor).isActive = true
        
        switch style {
        case .SUCCESS:
            let icon = SuccessIcon(frame: CGRect(x: 0, y: 0, width: 90, height: 90), animationTime:  0.33, animationDelay: 0.33)
            iconView.addSubview(icon)
            break
        case .WARNING:
            let icon = WarningIcon(frame: CGRect(x: 0, y: 0, width: 90, height: 90), animationTime:  0.33, animationDelay: 0.33)
            iconView.addSubview(icon)
            break
        case .DANGER:
            let icon = DangerIcon(frame: CGRect(x: 0, y: 0, width: 90, height: 90), animationTime:  0.33, animationDelay: 0.33)
            iconView.addSubview(icon)
            break
        case .INDICATOR:
            let icon = SpinnerIcon(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
            iconView.addSubview(icon)
            break
        case .INFO:
            let icon = InfoIcon(frame: CGRect(x: 0, y: 0, width: 90, height: 90), animationTime:  0.33, animationDelay: 0.33)
            iconView.addSubview(icon)
        }
    }

    public func setButtons(titleOk:String){
        bottomContainerView.addSubview(okButtonView)
        okButtonView.isUserInteractionEnabled = true
        okButtonView.backgroundColor = .white
        okButtonView.setTitleColor(.white, for: .normal)
        okButtonView.layer.cornerRadius = 8
        okButtonView.setTitle(titleOk, for: .normal)
        okButtonView.backgroundColor = Constants.Colors.SuccessColor
        okButtonView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        okButtonView.heightAnchor.constraint(equalToConstant:50).isActive = true
        okButtonView.widthAnchor.constraint(equalToConstant:150).isActive = true
        okButtonView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        okButtonView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor).isActive = true
        okButtonView.addTarget(self, action: #selector(self.didTappedOnBackgroundView), for: .touchUpInside)
    }
    
    public func setButtons(titleOk:String, eventOk: Selector, target: Any?){
        bottomContainerView.addSubview(okButtonView)
        okButtonView.isUserInteractionEnabled = true
        okButtonView.backgroundColor = .white
        okButtonView.setTitleColor(.white, for: .normal)
        okButtonView.layer.cornerRadius = 8
        okButtonView.setTitle(titleOk, for: .normal)
        okButtonView.backgroundColor = Constants.Colors.SuccessColor
        okButtonView.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        okButtonView.heightAnchor.constraint(equalToConstant:50).isActive = true
        okButtonView.widthAnchor.constraint(equalToConstant:150).isActive = true
        okButtonView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        okButtonView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor).isActive = true
        okButtonView.addTarget(target, action: eventOk, for: .touchUpInside)
        okButtonView.addTarget(self, action: #selector(self.didTappedOnBackgroundView), for: .touchUpInside)
    }
    
    public func setButtons(titleOk:String, eventOk: Selector, titleCancel:String, target: Any?){

        if displayedOnCompactDevice{
            if (titleOk.count + titleCancel.count) > 30  {
                containerButttons.axis = .vertical
                containerButttons.distribution = .fill
                containerButttons.alignment = .leading
                
                for b in [cancelButtonView, okButtonView]{
                    b.paddingLeft = 10
                    b.paddingRight = 10
                }
            }
        }
        
        containerButttons.addArrangedSubview(cancelButtonView)
        cancelButtonView.titleLabel?.adjustsFontSizeToFitWidth = true
        cancelButtonView.titleLabel?.minimumScaleFactor = 0.4
        cancelButtonView.backgroundColor = .white
        cancelButtonView.setTitleColor(.white, for: .normal)
        cancelButtonView.layer.cornerRadius = 8
        cancelButtonView.setTitle(titleCancel, for: .normal)
        cancelButtonView.backgroundColor = Constants.Colors.SecondaryText
        cancelButtonView.heightAnchor.constraint(equalToConstant:50).isActive = true
        cancelButtonView.addTarget(self, action: #selector(self.didTappedOnBackgroundView), for: .touchUpInside)
        
        containerButttons.addArrangedSubview(okButtonView)
        okButtonView.titleLabel?.adjustsFontSizeToFitWidth = true
        okButtonView.titleLabel?.minimumScaleFactor = 0.4
        okButtonView.backgroundColor = .white
        okButtonView.setTitleColor(.white, for: .normal)
        okButtonView.layer.cornerRadius = 8
        okButtonView.setTitle(titleOk, for: .normal)
        okButtonView.backgroundColor = Constants.Colors.SuccessColor
        okButtonView.heightAnchor.constraint(equalToConstant:50).isActive = true
        okButtonView.addTarget(target, action: eventOk, for: .touchUpInside)
        okButtonView.addTarget(self, action: #selector(self.didTappedOnBackgroundView), for: .touchUpInside)
    }
    
    public func setButtons(titleOk:String, eventOk: Selector,titleCancel:String, eventCancel: Selector, target: Any?){
        
        if displayedOnCompactDevice{
            if (titleOk.count + titleCancel.count) > 30 {
                containerButttons.axis = .vertical
                containerButttons.distribution = .fill
                containerButttons.alignment = .leading
                
                for b in [cancelButtonView, okButtonView]{
                    b.paddingLeft = 10
                    b.paddingRight = 10
                }
            }
        }
        
        containerButttons.addArrangedSubview(cancelButtonView)
        cancelButtonView.titleLabel?.adjustsFontSizeToFitWidth = true
        cancelButtonView.titleLabel?.minimumScaleFactor = 0.4
        cancelButtonView.backgroundColor = .white
        cancelButtonView.setTitleColor(.white, for: .normal)
        cancelButtonView.layer.cornerRadius = 8
        cancelButtonView.setTitle(titleCancel, for: .normal)
        cancelButtonView.backgroundColor = Constants.Colors.SecondaryText
        cancelButtonView.heightAnchor.constraint(equalToConstant:50).isActive = true
        cancelButtonView.addTarget(target, action: eventCancel, for: .touchUpInside)
        cancelButtonView.addTarget(self, action: #selector(self.didTappedOnBackgroundView), for: .touchUpInside)
        
        containerButttons.addArrangedSubview(okButtonView)
        okButtonView.titleLabel?.adjustsFontSizeToFitWidth = true
        okButtonView.titleLabel?.minimumScaleFactor = 0.4
        okButtonView.backgroundColor = .white
        okButtonView.setTitleColor(.white, for: .normal)
        okButtonView.layer.cornerRadius = 8
        okButtonView.setTitle(titleOk, for: .normal)
        okButtonView.backgroundColor = Constants.Colors.SuccessColor
        okButtonView.heightAnchor.constraint(equalToConstant:50).isActive = true
        okButtonView.addTarget(target, action: eventOk, for: .touchUpInside)
        okButtonView.addTarget(self, action: #selector(self.didTappedOnBackgroundView), for: .touchUpInside)
    }
    
    public func dismissWhenTappedOnBackgroundView(){
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
    func removeAutoConstraintsFromView(vs: Array<UIView>){
        for v in vs{v.translatesAutoresizingMaskIntoConstraints=false}
    }
    
    @objc func onOrientationChanged(){
        self.frame = UIScreen.main.bounds
        backgroundView.frame = UIScreen.main.bounds
        dialogView.updateConstraints()
    }
    
}

