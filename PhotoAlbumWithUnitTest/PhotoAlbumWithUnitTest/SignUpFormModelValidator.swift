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
        if firstName.isEmpty {
            returnValue = false
        }
        return returnValue
    }
}
