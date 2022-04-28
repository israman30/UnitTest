//
//  MockHttpClient.swift
//  UnitTestingHTTPTests
//
//  Created by Israel Manzo on 4/27/22.
//

import Foundation
@testable import UnitTestingHTTP

final class MockHttpClient: HttpClientProtocol, Mockable {
    
    func fetchData<T: Codable>(url: URL) async throws -> [T] {
        return loadJSON(filename: "MockPostResponse", type: T.self)
    }
    
}
