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
    
    public class AOConstarints {
        public var left: NSLayoutXAxisAnchor {
            return UIView().left
        }
        
        public var right: NSLayoutXAxisAnchor {
            return UIView().right
        }
        
        public var top: NSLayoutYAxisAnchor {
            return UIView().top
        }
        
        public var bottom: NSLayoutYAxisAnchor {
            return UIView().bottom
        }
        
        @available(iOS 11.0, *)
        public var safeArea: UILayoutGuide {
            return UIView().safeArea
        }
        
        /**
         Center X anchor isEqual centerXAnchor
         */
        public var centerX: NSLayoutXAxisAnchor {
            return UIView().centerX
        }
        /**
         Center Y anchor isEqual centerYAnchor
         */
        public var centerY: NSLayoutYAxisAnchor {
            return UIView().centerY
        }
        
        public var width: NSLayoutDimension {
            return UIView().width
        }
        
        public var height: NSLayoutDimension {
            return UIView().height
        }
    }
    
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
    /**
     Center X anchor isEqual centerXAnchor
     */
    var centerX: NSLayoutXAxisAnchor {
        return self.centerXAnchor
    }
    /**
     Center Y anchor isEqual centerYAnchor
     */
    var centerY: NSLayoutYAxisAnchor {
        return self.centerYAnchor
    }
    
    var width: NSLayoutDimension {
        return self.widthAnchor
    }
    
    var height: NSLayoutDimension {
        return self.heightAnchor
    }
    
    func fillSuperview() {
        self.removeAllConstraints()
        setupAnchor(top: superview?.top, left: superview?.left, bottom: superview?.bottom, right: superview?.right)
    }
    
    func setAnchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func setViewSize(size: CGSize = .zero) {
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
    
    func setupAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        self.removeAllConstraints()
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
    
    func setupCenter(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, on view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
//        self.removeAllConstraints()
        if centerX != nil {
            centerXAnchor.constraint(equalTo: view.centerX).isActive = true
        }
        if centerY != nil {
            centerYAnchor.constraint(equalTo: view.centerY).isActive = true
        }
    }
    
    func updateConstraints(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView == self || $0.secondItem as? UIView == self
            } ?? []

        self.superview?.removeConstraints(constraints)
        self.removeConstraints(self.constraints)
        
        self.setupAnchor(top: top, left: left, bottom: bottom, right: right, padding: padding, size: size)
    }
    
    func setupConstraints(_ closure: (_ constraints: AOConstarints) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.forEach { ($0 as NSLayoutConstraint).isActive = true }
    }
    
    func removeAllConstraints() {
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView == self || $0.secondItem as? UIView == self
            } ?? []
        
        self.superview?.removeConstraints(constraints)
        self.removeConstraints(self.constraints)
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
