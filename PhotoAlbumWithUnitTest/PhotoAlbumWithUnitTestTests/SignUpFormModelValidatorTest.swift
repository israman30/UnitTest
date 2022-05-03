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
    
    func testSignupFormValidation_WhenValidateLastName_ShouldReturnTrue() {
        let isLastNameValid = sut.isLastNameValid(lastName: "Doe")
        XCTAssertTrue(isLastNameValid, "Last name should return TRUE other wise FALSE")
    }
    
    func testSignUpFormModelValidator_WhenToShorLastNameProvided_ShouldReturnFalse() {
        let isValidLastName = sut.isLastNameValid(lastName: "D")
        XCTAssertFalse(isValidLastName, "Last name should retur FALSE if length is \(SignupConstants.lastNameMinLength) otherwise return TRUE")
    }
    
    func testSignUpFormModelValidator_WhenToLongLastNameProvided_ShouldReturnFalse() {
        let isValidLastName = sut.isLastNameValid(lastName: "DoeDoeDoeDoe")
        XCTAssertFalse(isValidLastName, "Last name should retur FALSE if length is \(SignupConstants.lastNameMaxLength) otherwise return TRUE")
    }
    
    func testSignUpFormModelValidator_WhenToEmailAddressProvided_ShouldReturnTrue() {
        let isValidEmailAddress = sut.isEmailAddressValid(email: "jhondoe@mail.com")
        XCTAssertTrue(isValidEmailAddress, "Email addresss is valid should return TRUE otherwise FALSE")
    }
    
    func testSignUpFormModelValidator_WhenToInvalidEmailAddressProvided_ShouldReturnFalse() {
        let isValidEmialAddress = sut.isLastNameValid(lastName: "jondoe@mail.com")
        XCTAssertFalse(isValidEmialAddress, "Invalid email provided should return FALSE othewise TRUE")
    }
    
    func testSignUpFormModelValidator_WhenToPasswordIsProvided_ShouldReturnTrue() {
        let isValidPassword = sut.isPasswordValid(password: "123456")
        XCTAssertTrue(isValidPassword, "Password should return TRUE for valid otherwise FALSE")
    }
    
    func testSignUpFormModelValidator_WhenToPasswordIsToShortProvided_ShouldReturnFalse() {
        let isValidPassword = sut.isPasswordValid(password: "1")
        XCTAssertFalse(isValidPassword, "Password should return FALSE if length is 2 otherwise TRUE")
    }
    
    func testSignUpFormModelValidator_WhenToPasswordIsToLongProvided_ShouldReturnFalse() {
        let isValidPassword = sut.isPasswordValid(password: "12345678901234568")
        XCTAssertFalse(isValidPassword, "Password should return FALSE if length is 2 otherwise TRUE")
    }

}
