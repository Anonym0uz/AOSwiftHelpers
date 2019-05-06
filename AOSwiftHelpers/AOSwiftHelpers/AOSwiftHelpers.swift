//
//  AOSwiftHelpers.swift
//  AOSwiftHelpers
//
//  Created by Alexander Orlov on 30.04.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

enum AOError: Error {
    case typeError(String)
}

import UIKit

public final class AOSwiftHelpers: NSObject {
    
    /**
     Work with logger
     */
    public static let sharedLogger = AOSwiftLogger()
    
    /**
     Work with UI
     */
    public static let sharedUI = AOSwiftUI()
    
    /**
     Work with helpers
     */
    public static let sharedHelper = AOSwiftHelpers()
}
