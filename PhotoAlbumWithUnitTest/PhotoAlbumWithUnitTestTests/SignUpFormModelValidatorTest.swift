//
//  SignUpFormModelValidator.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/2/22.
//

import XCTest
@testable import PhotoAlbumWithUnitTest

class SignUpFormModelValidatorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUpModelValidator_WhenValidateFirstName_ShouldReturnTrue() {
        // Arrange
        let sut = SignUpFormModelValidator()
        
        // Act
        let isFirtNameValid = sut.isFirstNameValid(firstName: "John")
        
        // Assert
        XCTAssertTrue(isFirtNameValid, "The method isFirstValid() should return TRUE but return FALSE")
    }

}
