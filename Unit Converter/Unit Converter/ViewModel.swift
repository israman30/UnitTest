//
//  ViewModel.swift
//  Unit Converter
//
//  Created by Israel Manzo on 6/27/23.
//

import SwiftUI

final class ViewModel: ObservableObject {
    
    @Published var text = ""
    @Published var convertedText = "$0"
    private var converter = Converters()
    
    func convertCurrenyc() {
        convertedText = converter.convertEUtoUSD(euro: text)
        hideKeyboard()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
