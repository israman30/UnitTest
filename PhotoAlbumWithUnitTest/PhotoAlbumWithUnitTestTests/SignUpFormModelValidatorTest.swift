//
//  SignUpFormModelValidator.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/2/22.
//

import XCTest
@testable import PhotoAlbumWithUnitTest

class SignUpFormModelValidatorTest: XCTestCase {
    
    var sut: SignUpFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSignUpModelValidator_WhenValidateFirstName_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isFirtNameValid = sut.isFirstNameValid(firstName: "John")
        
        // Assert
        XCTAssertTrue(isFirtNameValid, "The method isFirstValid() should return TRUE but return FALSE")
    }
    
    func testSignUpFormModelValidator_WhenToShorNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "T")
        // Assert
        XCTAssertFalse(isFirstNameValid, "The method should return FALSE if name is has \(SignupConstants.firstNameMinLength) otherwise TRUE")
    }
    
    func testSignUpFormModelValidator_WhenToLongNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Thombraunwonerelj")
        XCTAssertFalse(isFirstNameValid, "The method should return FALSE if name has \(SignupConstants.firstNameMaxLength) otherwise TRUE")
    }

}
