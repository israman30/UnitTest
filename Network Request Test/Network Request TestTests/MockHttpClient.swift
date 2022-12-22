//
//  MockHttpClient.swift
//  Network Request TestTests
//
//  Created by Israel Manzo on 12/21/22.
//

import Foundation
@testable import Network_Request_Test

final class MockHttpClient: HttpClientProtocol, Mockable {
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        return loadJson(filename: "SongResponse", type: T.self)
    }
    
    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws {
        
    }
    
    func delete(at id: UUID, url: URL) async throws {
        
    }
    
    
}
