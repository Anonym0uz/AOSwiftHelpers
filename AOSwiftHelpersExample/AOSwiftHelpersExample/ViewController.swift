//
//  ViewController.swift
//  AOSwiftHelpersExample
//
//  Created by Alexander Orlov on 06.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit
import AOSwiftHelpers

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AOSwiftHelpers.sharedLogger.AOLog("Test log!")
        self.view.backgroundColor = AOSwiftHelpers.sharedUI.hexColor(0xffffff)
        
        
        let testView = AOSwiftHelpers.sharedUI.setupView(backgroundColor: UIColor.red, parentView: self.view)
        let testView2 = AOSwiftHelpers.sharedUI.setupView(backgroundColor: UIColor.black, rounded: true, cornerRadius: 10, border: true, borderWidth: 1.0, borderColor: UIColor.red, parentView: self.view)
        
        if #available(iOS 11.0, *) {
            testView.setupAnchor(top: view.safeArea.top, left: view.safeArea.left, bottom: nil, right: view.safeArea.right, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
            testView2.setupAnchor(top: testView.bottom, left: view.left, bottom: nil, right: view.right, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
            testView2.setAnchorSize(to: testView)
            
        } else {
            // Fallback on earlier versions
            testView.setupAnchor(top: view.top, left: view.left, bottom: nil, right: view.left, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
            testView2.setupAnchor(top: testView.bottom, left: view.left, bottom: nil, right: view.right, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
            testView2.setAnchorSize(to: testView)
        }
    }


}

