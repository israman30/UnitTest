//
//  PostListViewModel.swift
//  UnitTestingHTTP
//
//  Created by Israel Manzo on 4/26/22.
//

import Foundation
import SwiftUI

class PostListViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    var httpClient: HttpClientProtocol!
    
    init(_ httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchPost() async throws {
        let urlString = Constants.baseUrl + Endpoint.posts
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let postResponse: [Post] = try await httpClient.fetchData(url: url)
        
        DispatchQueue.main.async {
            self.posts = postResponse
        }
    }
}
