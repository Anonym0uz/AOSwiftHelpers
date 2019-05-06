//
//  AOSwiftLogger.swift
//  AOSwiftHelpers
//
//  Created by Alexander Orlov on 02.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit

open class AOSwiftLogger: NSObject {

    private var isDebugBuild: Bool!
    
    public override init() {
        self.isDebugBuild = false
    }
    
    /**
     Setup logger.
     
     - Parameter debugBuild:   Build state for logger.
     */
    public func setupLogger(debugBuild: Bool!) {
        isDebugBuild = debugBuild
        let str = isDebugBuild ? "❗️❗️❗️Debug mode turn ON❗️❗️❗️" : "❗️❗️❗️Debug mode turn OFF❗️❗️❗️"
        print(str)
    }
    
    /**
     Log events.
     
     - Parameter str:   String parameter for logger.
     */
    public func AOLog<T>(_ object: T, _ file: String = #file, function: String = #function, line: Int = #line, trace: [String] = Thread.callStackSymbols) {
        
        if self.isDebugBuild {
            let fileString: NSString = NSString(string: file)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss:SSS"
            let process = ProcessInfo.processInfo
            let traceOutput: String = trace.map { "\t\t\($0)" }.reduce("\n") { "\($0)\n\($1)" }
            let output: String =  object is Error ? "\((object as! Error).localizedDescription)\(traceOutput)" : "\(object)"
            print("‼️ [\(process.processName)] \(dateFormatter.string(from: Foundation.Date())) ‼️" + "\n" + "[AOLogger -->] File: \(fileString.lastPathComponent)" + "\n" + "[AOLogger -->] Func: \(function)" + "\n" + "[AOLogger -->] Line: \(line)" + "\r[AOLogger -->] Desc: \(output)")
        } else {
            print("Build in production state!")
        }
    }
    
    internal func AOInternalLog<T>(_ object: T, _ file: String = #file, function: String = #function, line: Int = #line, trace: [String] = Thread.callStackSymbols) {
        let fileString: NSString = NSString(string: file)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss:SSS"
        let process = ProcessInfo.processInfo
        let traceOutput: String = trace.map { "\t\t\($0)" }.reduce("\n") { "\($0)\n\($1)" }
        let output: String =  object is Error ? "\((object as! Error).localizedDescription)\(traceOutput)" : "\(object)"
        print("‼️ [\(process.processName)] \(dateFormatter.string(from: Foundation.Date())) ‼️" + "\n" + "[AOLogger -->] File: \(fileString.lastPathComponent)" + "\n" + "[AOLogger -->] Func: \(function)" + "\n" + "[AOLogger -->] Line: \(line)" + "\r[AOLogger -->] Desc: \(output)")
    }
}
