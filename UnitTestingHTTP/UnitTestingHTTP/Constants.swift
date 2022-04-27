//
//  Constants.swift
//  UnitTestingHTTP
//
//  Created by Israel Manzo on 4/25/22.
//

import Foundation

enum Constants {
    static let baseUrl = "https://jsonplaceholder.typicode.com/"
}

enum Endpoint {
    static let posts = "posts"
}

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    case add
    case update(Post)
}
