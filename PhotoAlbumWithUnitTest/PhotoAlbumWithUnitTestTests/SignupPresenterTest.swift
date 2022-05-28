//
//  SignupPresenterTest.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/27/22.
//

import XCTest
@testable import PhotoAlbumWithUnitTest

class SignupPresenterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupPresenter_WhenInfoProvided_ValidatEachProperty() {
        // Arrange
        let signupFormModel = SignupFormModel(name: "John", lastName: "Doe", email: "jdoe@mail.io", password: "123456", repeatPassword: "123456")
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "")
    }

}
