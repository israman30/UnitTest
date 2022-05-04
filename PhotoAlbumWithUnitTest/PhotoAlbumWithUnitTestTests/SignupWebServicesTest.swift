//
//  SignupWebServicesTest.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/3/22.
//

import XCTest
@testable import PhotoAlbumWithUnitTest

class SignupWebServicesTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebservices_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange
        let sut = SignupWebServices()
        let sigupFormRequestModel = SignupFormRequestModel(firstName: "John", lastName: "Doe", email: "johndoe@mail.com", passwrod: "123456")
        // Act
        sut.signup(withForm: sigupFormRequestModel)
        
        // Assert
    }

}
