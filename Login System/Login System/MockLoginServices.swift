//
//  MockLoginServices.swift
//  Login System
//
//  Created by Israel Manzo on 6/29/23.
//

import SwiftUI

final class MockLoginService: LoginServiceProtocol {
    
    var loginResult: Result<Void, Error> = .success(())
    
    func login(with email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(loginResult)
    }
}
