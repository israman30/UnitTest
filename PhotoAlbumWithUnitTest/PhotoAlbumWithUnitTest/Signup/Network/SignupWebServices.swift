//
//  SignupWebServices.swift
//  PhotoAlbumWithUnitTest
//
//  Created by Israel Manzo on 5/3/22.
//

import Foundation

class SignupWebServices {
    
    private var usrString: String
    
    init(urlString: String) {
        self.usrString = urlString
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping(SignupResponseModel?, SignupError?)->Void) {
        guard let url = URL(string: usrString) else {
            // TODO: Create UNIT TEST
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            
        }
        dataTask.resume()
    }
}
