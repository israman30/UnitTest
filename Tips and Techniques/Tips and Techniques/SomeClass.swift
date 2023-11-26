//
//  SomeClass.swift
//  Tips and Techniques
//
//  Created by Israel Manzo on 11/23/23.
//

import Foundation
import UIKit

// MARK: - Some production object
class MyClass {
    private static var allInstances = 0
    private let instance: Int
    
    init() {
        MyClass.allInstances += 1
        instance = MyClass.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit {
        print(">> MyClass.deinit #\(instance)")
    }
    
    func methodOne() {
        print("-> Method One")
    }
    
    func methodTwo() {
        print("-> Method Two")
    }
}

struct SimpleStruct: CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String { "(\(x) \(y))" }
}

// MARK: - Covering some class
class CoveredClass {
    
    private(set) var area: Int
    
    var width: Int {
        didSet {
            area = width * width
            let color: UIColor = redOrGreen(for: width)
            drawSquare(width: width, color: color)
        }
    }
    
    init() {
        area = 0
        width = 0
    }
    
    private func redOrGreen(for width: Int) -> UIColor {
        width % 2 == 0 ? .red : .green
    }
    
    private func drawSquare(width: Int, color: UIColor) {}
    
    static func max(_ x: Int, _ y: Int) -> Int {
        if x < y {
            return y
        } else {
            return x
        }
    }
    
    static func commaSeparated(from: Int, to: Int) -> String {
        var result = ""
        for i in from..<to {
            result += "\(i)"
        }
        result += "\(to)"
        return result
    }
}
