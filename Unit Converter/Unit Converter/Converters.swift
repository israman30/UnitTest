//
//  Converters.swift
//  Unit Converter
//
//  Created by Israel Manzo on 6/27/23.
//

import Foundation


class Converters {
    func convertEUtoUSD(euro: String) -> String {
        let usdRate = 1.08
        let euroValue = Double(euro) ?? 0.0
        
        if euroValue <= 0 {
            return "Enter a valid value"
        } else if euroValue >= 1_000_000 {
            return "To big value for converting"
        }
        return "$\(String(format: "%.2f", euroValue * usdRate))"
    }
}
