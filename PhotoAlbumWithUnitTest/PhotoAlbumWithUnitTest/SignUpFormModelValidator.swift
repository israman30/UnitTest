//
//  SignUpFormModelValidator.swift
//  PhotoAlbumWithUnitTest
//
//  Created by Israel Manzo on 5/2/22.
//

import Foundation

class SignUpFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isEmailAddressValid(email: String) -> Bool {
        var returnValue = true
        if email.isEmpty || !email.contains("@") {
            returnValue = false
        }
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        if password.count < SignupConstants.passwordMinLength || password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }
        return returnValue
    }
}
