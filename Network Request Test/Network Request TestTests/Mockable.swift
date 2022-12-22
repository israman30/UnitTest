//
//  Mockable.swift
//  Network Request TestTests
//
//  Created by Israel Manzo on 12/21/22.
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJson<T: Decodable>(filename: String, type: T.Type) -> [T]
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJson<T: Decodable>(filename: String, type: T.Type) -> [T] {
        guard let pathURL = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load json file")
        }
        do {
            let data = try Data(contentsOf: pathURL)
            let decodeObject = try JSONDecoder().decode([T].self, from: data)
            return decodeObject
        } catch {
            print("❌ \(error)")
            fatalError("Failed decoding json")
        }
    }
}
