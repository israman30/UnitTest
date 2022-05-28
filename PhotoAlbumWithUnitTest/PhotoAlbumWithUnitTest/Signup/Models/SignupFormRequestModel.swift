//
//  SignupFormRequestModel.swift
//  PhotoAlbumWithUnitTest
//
//  Created by Israel Manzo on 5/3/22.
//

import Foundation


struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let passwrod: String
}
