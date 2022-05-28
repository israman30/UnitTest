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
    var isLastNameValidated = false
    var isEmailValidated = false
    var isPasswordValidated = false
    var isPasswordEqualityValidated = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailAddressValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
}
