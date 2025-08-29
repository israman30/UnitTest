//
//  ContentView.swift
//  Clean Unit Test
//
//  Created by Israel Manzo on 8/28/25.
//

import SwiftUI

enum CatalogError: Error, Equatable {
    case invalidPage
    case pageOutOfBounds
    case missingContent
}

struct Catalog {
    let maxPages: Int
    let content: [String]
    func content(for page: Int) throws -> String {
        guard page >= 0 else { throw CatalogError.invalidPage }
        guard page < maxPages else { throw CatalogError.pageOutOfBounds }
        guard page < content.count else { throw CatalogError.missingContent }
        
        return content[page]
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
