//
//  SignupModelValidatorProtocol.swift
//  PhotoAlbumWithUnitTest
//
//  Created by Israel Manzo on 5/27/22.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailAddressValid(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}
