//
//  SongListViewModelTest.swift
//  Network Request TestTests
//
//  Created by Israel Manzo on 12/24/22.
//

import XCTest
@testable import Network_Request_Test

final class SongListViewModelTest: XCTestCase {
    
    var songListViewModel: SongListViewModel!

    override func setUp() {
        super.setUp()
        songListViewModel = SongListViewModel(httpClient: MockHttpClient())
    }
    
    override func tearDown() {
        super.tearDown()
        songListViewModel = nil
    }
    
    func test_fecthSong_Successfully() async throws {
        try await songListViewModel.fetchSongs()
        
        XCTAssertEqual(songListViewModel.songs.count, 2)
    }
}
