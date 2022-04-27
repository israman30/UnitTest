//
//  AddUpdateViewModel.swift
//  UnitTestingHTTP
//
//  Created by Israel Manzo on 4/26/22.
//

import SwiftUI

class AddUpdateViewModel: ObservableObject {
    @Published var postTitle = ""
    
    var postID: UUID?
    
    var isUpdating: Bool {
        postID != nil
    }
    
    var buttonTitle: String {
        postID != nil ? "Update Post" : "Add Post"
    }
    
    init() { }
    
    init(currentPost: Post) {
        self.postTitle = currentPost.title
        self.postID = currentPost.id
    }
    
    func addPost() async throws {
        let urlString = Constants.baseUrl + Endpoint.posts
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let post = Post(id: nil, title: postTitle)
        
        try await HttpClient.shared.sendPost(to: url, object: post, httpMethod: HttpMethods.POST.rawValue)
    }
    
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            do {
                if isUpdating {
                    // updateSong()
                } else {
                    try await addPost()
                }
            } catch {
                print("❌ Error: \(error)")
            }
            completion()
        }
    }
}
