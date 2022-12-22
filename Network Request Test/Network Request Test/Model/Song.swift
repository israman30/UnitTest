//
//  Song.swift
//  Network Request Test
//
//  Created by Israel Manzo on 12/21/22.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
