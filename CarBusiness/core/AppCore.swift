//
//  AppCore.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import Foundation

final class AppCore {
    
    let carManager: CarManager
    let userDefaultsManager: UserDefaultsManager
    let authenticationManager: AuthenticationManager
    
    init() {
        carManager = CarManager()
        userDefaultsManager = UserDefaultsManager()
        authenticationManager = AuthenticationManager()
    }
}
