//
//  Colors.swift
//  NKAlert
//
//  Created by Nelkit Chavez on 7/12/20.
//  Copyright © 2020 Nelkit Chavez. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func colorWithHexString (hex:String, alpha: CGFloat = 1.0) -> UIColor {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        return self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

class Colors {
    static let success = UIColor.colorWithHexString(hex: "#1ABC9C")
    static let danger = UIColor.colorWithHexString(hex: "#E74C3C")
    static let warning = UIColor.colorWithHexString(hex: "#F39C12")
    static let info = UIColor.colorWithHexString(hex: "#3498DB")
    static let spinner = UIColor.colorWithHexString(hex: "#2ECC71")
}
