//
//  ViewsExampleController.swift
//  AOSwiftHelpersExample
//
//  Created by Alexander Orlov on 11.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit
import AOSwiftHelpers

class ViewsExampleController: UIViewController {
    
    var contAnimate: Bool = false
    
    var testView: UIView!
    
    var testView2: UIView = {
        let view = AOSwiftHelpers.UI.setupView(backgroundColor: UIColor.red, parentView: nil)
        return view
    }()
    
    var testView3: UIView = {
        let view = AOSwiftHelpers.UI.setupView(backgroundColor: UIColor.magenta, rounded: true, cornerRadius: 10, parentView: nil)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createViews()
    }
    
    func createViews() {
        self.view.backgroundColor = UIColor.white
        self.testView = AOSwiftHelpers.UI.setupView(backgroundColor: UIColor.lightGray, parentView: self.view)
        self.testView.translatesAutoresizingMaskIntoConstraints = false
        self.testView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gesturePressed))
        testView.addGestureRecognizer(gesture)
        
        view.addSubviews(views: [testView2, testView3])
        
        self.setupConstraints()
    }
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            testView.setupAnchor(top: view.safeArea.top, left: view.left, bottom: nil, right: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0), size: CGSize(width: 100, height: 100))
        } else {
            // Fallback on earlier versions
            
        }
    }
    
    override func updateViewConstraints() {
        if contAnimate == false {
            if #available(iOS 11.0, *) {
                testView.updateConstraints(top: view.safeArea.top, left: view.left, bottom: nil, right: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0), size: CGSize(width: 100, height: 100))
            } else {
            }
        } else {
            if #available(iOS 11.0, *) {
                testView.updateConstraints(top: nil, left: nil, bottom: view.safeArea.bottom, right: view.right, padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10), size: CGSize(width: 100, height: 100))
            }
        }
        super.updateViewConstraints()
    }
    
    @objc func gesturePressed() {
        self.contAnimate = !self.contAnimate
        AOSwiftHelpers.UI.animateConstraints(parentView: self.view)
    }
    
}
