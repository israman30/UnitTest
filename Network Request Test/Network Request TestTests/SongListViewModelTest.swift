//
//  SongListViewModelTest.swift
//  Network Request TestTests
//
//  Created by Israel Manzo on 12/24/22.
//

import XCTest
import Combine
@testable import Network_Request_Test

final class SongListViewModelTest: XCTestCase {
    
    var songListViewModel: SongListViewModel!
    private var cancellable: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        songListViewModel = SongListViewModel(httpClient: MockHttpClient())
        cancellable = []
    }
    
    override func tearDown() {
        super.tearDown()
        songListViewModel = nil
        cancellable = []
    }
    
    func test_fecthSong_Successfully() async throws {
        let expectation = XCTestExpectation(description: "Fetched Songs")
        
        try await songListViewModel.fetchSongs()
        
        songListViewModel
            .$songs
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value.count, 2)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        wait(for: [expectation], timeout: 1)
    }
}
