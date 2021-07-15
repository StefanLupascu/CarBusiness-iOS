//
//  UserDefaultManager.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import Foundation

final class UserDefaultsManager {
    
    private let USER_KEY = "USER_KEY"
    
    private let userDefaultsPlugin = UserDefaults.standard
    
    func saveSession(with token: String) {
        userDefaultsPlugin.set(token, forKey: USER_KEY)
    }
    
    func getSession() -> String? {
        guard let data = userDefaultsPlugin.data(forKey: USER_KEY) else {
            return nil
        }
        return String(decoding: data, as: UTF8.self)
    }
}
