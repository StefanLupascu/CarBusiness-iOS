//
//  LoginDependency.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import Foundation

struct LoginDependency {
    
    let router: NavigationRouter
    let userDefaultsManager: UserDefaultsManager
    let authenticationManager: AuthenticationManager
}
