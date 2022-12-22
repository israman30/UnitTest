//
//  SongListViewModel.swift
//  Network Request Test
//
//  Created by Israel Manzo on 12/21/22.
//

import SwiftUI

class SongListViewModel: ObservableObject {
    
    @Published var songs = [Song]()
    
    var httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func fetchSongs() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let songResponse: [Song] = try await httpClient.fetch(url: url)
        
        DispatchQueue.main.async {
            self.songs = songResponse
        }
    }
    
    func delete(at offset: IndexSet) {
        offset.forEach {
            guard let songId = songs[$0].id else { return }
            
            guard let url = URL(string: Constants.baseURL + Endpoints.songs + "\(songId)") else { return }
            
            Task {
                do {
                    try await httpClient.delete(at: songId, url: url)
                } catch {
                    print("Something went wrong")
                }
            }
        }
        songs.remove(atOffsets: offset)
    }
}
