//
//  SignupWebServices.swift
//  PhotoAlbumWithUnitTest
//
//  Created by Israel Manzo on 5/3/22.
//

import Foundation

class SignupWebServices {
    
    private var urlSession: URLSession
    private var uslString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.uslString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping(SignupResponseModel?, SignupError?)->Void) {
        guard let url = URL(string: uslString) else {
            // TODO: Create UNIT TEST
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            // TODO: write new Unit Test to handle error
            guard let data = data else { return }
            
            if let signResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(signResponseModel, nil)
            } else {
                completion(nil, SignupError.responseModelParsinError)
            }
            
        }
        dataTask.resume()
    }
}
