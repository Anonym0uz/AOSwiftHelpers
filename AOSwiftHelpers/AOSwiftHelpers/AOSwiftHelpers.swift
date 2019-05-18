//
//  AOSwiftHelpers.swift
//  AOSwiftHelpers
//
//  Created by Alexander Orlov on 30.04.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit

public class AOSwiftHelpers: NSObject {
    /**
     Work with helpers
     */
    public static let helper = AOSwiftHelpers()
    
    public static let UI = AOSwiftUI()
    
    public static let logger = AOSwiftLogger()
}
// MARK: - Functions
extension AOSwiftHelpers {
    /**
     Setup navigation
     - parameters:
     - navigationCtrl: Set view navigation controller
     - navigationItem: Set view navigation item
     - navigationTitle: Set navigation title
     - hideBackButton: Enable/disable back text
     - leftButton: Set left button (must be nil)
     - rightButton: Set right button (must be nil)
     */
    public func setupNavigation(navigationCtrl: UINavigationController!,
                         navigationItem: UINavigationItem!,
                         navigationTitle: String,
                         hideBackButton: Bool = false,
                         leftButton: UIBarButtonItem?,
                         rightButton: UIBarButtonItem?) -> Void {
        navigationItem.title = navigationTitle
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationCtrl.navigationBar.barTintColor = UIColor.white
        navigationCtrl.navigationBar.isTranslucent = false
        navigationCtrl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        if hideBackButton {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        }
    }
    
    public func setupBarButtonItem(title: String,
                            imgName: String?,
                            target: AnyObject,
                            buttonSelector: Selector) -> UIBarButtonItem {
        let btnItem = UIBarButtonItem()
        btnItem.title = title
        if (imgName != nil) {
            btnItem.title = ""
            btnItem.image = UIImage(named: imgName!)
        }
        btnItem.style = .plain
        btnItem.action = buttonSelector
        btnItem.target = target
        return btnItem
    }
}
