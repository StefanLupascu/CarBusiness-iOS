//
//  AuthenticationManager.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import Alamofire
import SwiftyJSON

final class AuthenticationManager {
    
    private let BASE_URL = "http://192.168.0.129:9090"
    private let plugin = AF
    
    func authenticate(with username: String, and password: String, completion: @escaping ApiResponse<String>) {
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        plugin.request(BASE_URL + "/authenticate", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            guard let data = response.data else {
                completion(nil, response.error?.errorDescription)
                return
            }
            
            let token = String(decoding: data, as: UTF8.self)
            
            completion(token, nil)
        }
    }
}
