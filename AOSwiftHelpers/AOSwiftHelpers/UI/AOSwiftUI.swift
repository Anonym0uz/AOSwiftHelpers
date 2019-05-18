//
//  AOSwiftUI.swift
//  AOSwiftHelpers
//
//  Created by Alexander Orlov on 02.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit

public class AOSwiftUI: NSObject {
    
    public static let UI = AOSwiftUI()
    
    internal override init() {
        super.init()
    }
    
    /**
     Work with HEX string color
     
     - Parameter str: HEX string (with # or w/o #)
     - Parameter alpha: Set alpha for color (0.0 - 1.0)
     */
    public func hexColor(_ str : String!,
                         alpha: CGFloat = 1.0) -> UIColor {
        let hexString: String = str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    /**
     Work with HEX UInt color
     
     - Parameter hex: UInt32, like (0xffffff)
     - Parameter alpha: Set alpha for color (0.0 - 1.0)
     */
    public func hexColor(_ hex : UInt32!,
                         alpha: CGFloat = 1.0) -> UIColor {
        
        let r = Int(hex >> 16) & 0xFF
        let g = Int(hex >> 8) & 0xFF
        let b = Int(hex) & 0xFF
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

// MARK: - Work with view
extension AOSwiftUI {
    /**
     Create simple view
     - parameters:
        - backgroundColor: Set view background color - UIColor
        - rounded: Enable clipToBounds for view - Bool
        - cornerRadius: Set corner radius (rounded parameter should be true) - CGFloat
        - border: Enable/disable border - Bool
        - borderWidth: Set border width (border parameter should be true) - CGFloat
        - borderColor: Set border color (border parameter should be true) - UIColor
        - parentView: Set parent view - UIView
     */
    public func setupView(backgroundColor: UIColor,
                          rounded: Bool = false,
                          cornerRadius: CGFloat = 0,
                          border: Bool = false,
                          borderWidth: CGFloat = 0,
                          borderColor: UIColor = UIColor.black,
                          parentView: UIView?) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        if rounded == true {
            view.clipsToBounds = true
            view.layer.cornerRadius = cornerRadius
        }
        if border == true {
            view.layer.borderWidth = borderWidth
            view.layer.borderColor = borderColor.cgColor
        }
        if (parentView != nil) { parentView!.addSubview(view) }
        return view
    }
    /**
     Animate constraints
     - parameters:
     - duration: Set animation duration
     - parentView: Set view where constraints will be animate
     */
    public func animateConstraints(duration: Double = 1.0,
                            parentView: UIView!) -> Void {
        parentView.setNeedsUpdateConstraints()
        parentView.updateConstraintsIfNeeded()
        UIView.animate(withDuration: duration, animations: { () -> Void in
            parentView.layoutIfNeeded()
        }, completion: nil)
        
    }
}
// MARK: - Work with button
extension AOSwiftUI {
    public func setupButton(buttonText: String = "",
                            parentView: UIView?) -> UIButton {
        let button = UIButton()
        button.setTitle(buttonText, for: .normal)
        if (parentView != nil) { parentView?.addSubview(button) }
        return button
    }
}

// MARK: - Work with label
extension AOSwiftUI {
    public func setupLabel(text: String?,
                           textColor: UIColor = UIColor.black,
                           textFont: String?,
                           textModificator: String?,
                           textSize: CGFloat? = 14,
                           parentView: UIView?) -> UILabel {
        let lbl = UILabel()
        lbl.text = text
        lbl.textColor = textColor
        if (textFont != nil) {
            if (textModificator != nil) {
                lbl.font = UIFont(name: textFont! + "-" + textModificator!, size: textSize!)
            } else {
                lbl.font = UIFont(name: textFont!, size: textSize!)
            }
        } else {
            lbl.font = UIFont.systemFont(ofSize: textSize!)
        }
        if parentView != nil { parentView?.addSubview(lbl) }
        return lbl
    }
}
