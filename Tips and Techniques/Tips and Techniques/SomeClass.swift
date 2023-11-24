//
//  SomeClass.swift
//  Tips and Techniques
//
//  Created by Israel Manzo on 11/23/23.
//

import Foundation

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
    static func max(_ x: Int, _ y: Int) -> Int {
        if x < y {
            return y
        } else {
            return x
        }
    }
}
