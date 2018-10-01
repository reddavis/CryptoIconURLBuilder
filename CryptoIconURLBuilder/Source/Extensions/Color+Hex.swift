//
//  Color+Hex.swift
//  CryptoIconURLBuilder
//
//  Created by Red Davis on 01/10/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

#if os(macOS)
import AppKit
public typealias Color = NSColor
#else
import UIKit
public typealias Color = UIColor
#endif


internal extension Color
{
    internal var hex: String {
        var redValue: CGFloat = 0.0
        var greenValue: CGFloat = 0.0
        var blueValue: CGFloat = 0.0
        
#if os(macOS)
        redValue = self.redComponent
        greenValue = self.greenComponent
        blueValue = self.blueComponent
#else
        self.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: nil)
#endif
        
        redValue *= 255.0
        greenValue *= 255.0
        blueValue *= 255.0
        
        let red = String(format: "%02x", Int(redValue))
        let green = String(format: "%02x", Int(greenValue))
        let blue = String(format: "%02x", Int(blueValue))
        
        return (red + green + blue).lowercased()
    }
    
    internal convenience init(hex: String)
    {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#"))
        {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
