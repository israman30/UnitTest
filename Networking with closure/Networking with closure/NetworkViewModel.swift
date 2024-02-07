//
//  NetworkViewModel.swift
//  Networking with closure
//
//  Created by Israel Manzo on 2/6/24.
//

import Foundation

protocol NetworkProtocol {
    func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void)
}

class DataViewModel: NetworkProtocol {
    private let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        networkManager.fetchData(completion: completion)
    }
}
