//
//  Post.swift
//  UnitTestingHTTP
//
//  Created by Israel Manzo on 4/25/22.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: UUID?
    let title: String
    let body: String = ""
}
