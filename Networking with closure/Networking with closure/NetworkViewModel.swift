//
//  NetworkViewModel.swift
//  Networking with closure
//
//  Created by Israel Manzo on 2/6/24.
//

import Foundation

class DataViewModel {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        networkManager.fetchData(completion: completion)
    }
}
