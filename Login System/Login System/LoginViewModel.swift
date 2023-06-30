//
//  LoginViewModel.swift
//  Login System
//
//  Created by Israel Manzo on 6/29/23.
//

import SwiftUI

enum Action {
    case login
    case errorLogin
}

final class LoginViewModel: ObservableObject {
    let title = "Login"
    let subtitle = "Welcome back"
    let emailPlaceholder = "Enter email"
    let passwordPlaceholder = "Pasword"
    let loginButton = "Login"
    let errorButton = "OK"
    
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var isLoading = false
    @Published var successTapped = false
    @Published var error: Error?
    private let loginService: LoginServiceProtocol
    
    init(_ loginServices: LoginServiceProtocol = LoginService()) {
        self.loginService = loginServices
    }
    
    func send(_ action: Action) {
        switch action {
        case .login:
            loginService.login(with: emailText, password: passwordText) { result in
                switch result {
                case .success:
                    self.successTapped = true
                case .failure(let error):
                    self.error = error
                }
            }
        case .errorLogin:
            break
        }
    }
}

protocol LoginServiceProtocol {
    func login(with email: String, password: String, completion: @escaping(Result<Void, Error>) -> Void)
}

class LoginService: LoginServiceProtocol {
    var login = false
    func login(with email: String, password: String, completion: @escaping(Result<Void, Error>) -> Void) {
        if login {
            completion(.failure(assertionFailure("Something went wrong") as! Error))
        } else {
            completion(.success(()))
        }
    }
}
