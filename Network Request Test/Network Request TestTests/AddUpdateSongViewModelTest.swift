//
//  AddUpdateSongViewModelTest.swift
//  Network Request TestTests
//
//  Created by Israel Manzo on 12/25/22.
//

import XCTest
@testable import Network_Request_Test

final class AddUpdateSongViewModelTest: XCTestCase {
    
    var sut: AddUpdateSongViewModel!

    override func setUp() {
        super.setUp()
        sut = AddUpdateSongViewModel(httpClient: MockHttpClient())
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_NoEmptySong_canBAdded() {
        sut.songTitle = "HI "
        XCTAssertTrue(sut.isValidSong(), "The song must be valid")
    }
    
    func test_whiteSpaceSong_Failing() {
        sut.songTitle = " "
        XCTAssertFalse(sut.isValidSong(), "The song should not be valid")
    }
    
    func test_updateSong_NotNil() {
        let isUpdating = sut.isUpdating
        XCTAssertNotNil(isUpdating)
    }
    
    func test_buttonTitle_SwitchTitle() {
        let title = sut.buttonTitle
        
        XCTAssertNotNil(!title.isEmpty)
        
        if sut.songID != nil {
            XCTAssertEqual(title, "Update Song")
        } else if sut.songID == nil {
            XCTAssertEqual(title, "Add Song")
        }
    }

}
