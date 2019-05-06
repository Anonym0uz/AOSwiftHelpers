//
//  AOSwiftHelpersExtensions.swift
//  AOSwiftHelpers
//
//  Created by Alexander Orlov on 02.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit

public extension UILayoutGuide {
    /**
     Left anchor isEqual leadingAnchor
     */
    var left: NSLayoutXAxisAnchor {
        return self.leadingAnchor
    }
    
    /**
     Right anchor isEqual trailingAnchor
     */
    var right: NSLayoutXAxisAnchor {
        return self.trailingAnchor
    }
    
    /**
     Top anchor isEqual topAnchor
     */
    var top: NSLayoutYAxisAnchor {
        return self.topAnchor
    }
    
    /**
     Bottom anchor isEqual bottomAnchor
     */
    var bottom: NSLayoutYAxisAnchor {
        return self.bottomAnchor
    }
}

public extension UIView {
    /**
     Left anchor isEqual leadingAnchor
     */
    var left: NSLayoutXAxisAnchor {
        return self.leadingAnchor
    }
    
    /**
     Right anchor isEqual trailingAnchor
     */
    var right: NSLayoutXAxisAnchor {
        return self.trailingAnchor
    }
    
    /**
     Top anchor isEqual topAnchor
     */
    var top: NSLayoutYAxisAnchor {
        return self.topAnchor
    }
    
    /**
     Bottom anchor isEqual bottomAnchor
     */
    var bottom: NSLayoutYAxisAnchor {
        return self.bottomAnchor
    }
    
    /**
     iPhone X guidelines, safe zone isEqual safeAreaLayoutGuide (iOS 11 or newer)
     */
    @available(iOS 11.0, *)
    var safeArea: UILayoutGuide {
        return self.safeAreaLayoutGuide
    }
    
    func fillSuperview() {
        setupAnchor(top: superview?.top, left: superview?.left, bottom: superview?.bottom, right: superview?.right)
    }
    
    func setAnchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func setupAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func setupConstraints() {
        
    }
    
    /**
     Add subviews one-line code
     
     - Parameter views: Views in array
     - Example
     ```
        view.addSubviews(views: [testView1, testView2, testView3])
     ```
     */
    func addSubviews(views: [Any]) {
        views.forEach { self.addSubview($0 as! UIView) }
    }
}
