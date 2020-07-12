//
//  Button.swift
//  NKAlert
//
//  Created by Nelkit Chavez on 7/12/20.
//  Copyright © 2020 Nelkit Chavez. All rights reserved.
//

import UIKit
import Foundation

/// Es una extension de UIButton con otras mejoras como: sombras, bordes redondiados, etc.
@IBDesignable
class Button: UIButton {
    let label = UILabel()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    // MARK: - Lifecyle
    override open func awakeFromNib() {
        
    }
    
    /// Agregar un borde redóndeado al UIButton
    @IBInspectable var cornerRadius: CGFloat = 25 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    /// Agrega un relleno abajo
    @IBInspectable var paddingTop: CGFloat = 0 {
        didSet {
            setPadding()
        }
    }
    
    /// Agrega un relleno abajo
    @IBInspectable var paddingBottom: CGFloat = 0 {
        didSet {
            setPadding()
        }
    }
    
    /// Agrega un relleno a la izquierda
    @IBInspectable var paddingLeft: CGFloat = 0 {
        didSet {
            setPadding()
        }
    }
    
    /// Agrega un relleno a la derecha
    @IBInspectable var paddingRight: CGFloat = 0 {
        didSet {
            setPadding()
        }
    }
    
    /// Agrega una mascara de recorte cuando sea necesario
    @IBInspectable var overflowHidden: Bool = false {
        didSet {
            layer.masksToBounds = overflowHidden
        }
    }
    
    /// Agrega el ancho del borde del view
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    /// Agrega el color del borde del view
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    /// Agrega una sombra al view
    @IBInspectable var elevate: Double = 0 {
        didSet {
            if elevate > 0{
                self.layer.masksToBounds = false
                self.layer.shadowColor = elevateColor.cgColor
                self.layer.shadowOffset = CGSize(width: 0, height: elevate)
                self.layer.shadowRadius = CGFloat(6)
                self.layer.shadowOpacity = 1
            }
        }
    }
    
    @IBInspectable var elevateColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1492627641) {
        didSet {
            if elevate > 0{
                self.layer.masksToBounds = false
                self.layer.shadowColor = elevateColor.cgColor
                self.layer.shadowOffset = CGSize(width: 0, height: elevate)
                self.layer.shadowRadius = CGFloat(6)
                self.layer.shadowOpacity = 1
            }
        }
    }
    
    /// Renderiza el color dependiendo si esta habilitada o deshabilitado
    override var isEnabled: Bool{
        didSet{
            if isEnabled{
                self.layer.opacity = 1
                self.isUserInteractionEnabled = true
            }else{
                self.layer.opacity = 0.3
                self.isUserInteractionEnabled = false
            }
        }
    }
    

    
    /// Agrega un estilo de hipervinculo con subrayado
    @IBInspectable var setUnderline: Bool = false{
        didSet{
            guard let text = self.titleLabel?.text else { return }
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
            
            self.setAttributedTitle(attributedString, for: .normal)
        }
    }
    
    /// Quita la sombra cuando el UIButton esta selccionado
    override var isSelected: Bool{
        didSet{
            if elevate > 0{
                if isSelected{
                    self.layer.masksToBounds = false
                    self.layer.shadowColor = elevateColor.cgColor
                    self.layer.shadowOffset = CGSize(width: 0, height: 0)
                    self.layer.shadowRadius = CGFloat(6)
                    self.layer.shadowOpacity = 1
                }else{
                    self.layer.masksToBounds = false
                    self.layer.shadowColor = elevateColor.cgColor
                    self.layer.shadowOffset = CGSize(width: 0, height: elevate)
                    self.layer.shadowRadius = CGFloat(6)
                    self.layer.shadowOpacity = 1
                }
            }
        }
    }
    
    /// Reduce la escala del UIButton cuando  esta selccionado
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                UIView.animate(withDuration: 0.3, animations: {
                    if self.elevate > 0{
                        self.layer.masksToBounds = false
                        self.layer.shadowColor = self.elevateColor.cgColor
                        self.layer.shadowOffset = CGSize(width: 0, height: 0)
                        self.layer.shadowRadius = CGFloat(3)
                        self.layer.shadowOpacity = 1
                    }
                    self.transform = CGAffineTransform.identity
                })
            }else{
                UIView.animate(withDuration: 0.3, animations: {
                    if self.elevate > 0{
                        self.layer.masksToBounds = false
                        self.layer.shadowColor = self.elevateColor.cgColor
                        self.layer.shadowOffset = CGSize(width: 0, height: self.elevate)
                        self.layer.shadowRadius = CGFloat(6)
                        self.layer.shadowOpacity = 1
                    }
 
                    
                })
            }
        }
    }
    
    /// Agrega un relleno en todos Bordes del control
    func setPadding() {
        self.contentEdgeInsets = UIEdgeInsets(top: paddingTop, left: paddingLeft, bottom: paddingBottom, right: paddingRight)
    }
}
