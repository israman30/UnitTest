//
//  MockSignupModelValidator.swift
//  PhotoAlbumWithUnitTestTests
//
//  Created by Israel Manzo on 5/27/22.
//

import Foundation
@testable import PhotoAlbumWithUnitTest

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        return true
    }
    
    func isEmailAddressValid(email: String) -> Bool {
        return true
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }
    
}
