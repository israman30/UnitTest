//
//  ModalType.swift
//  Network Request Test
//
//  Created by Israel Manzo on 12/21/22.
//

import SwiftUI

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(Song)
}
