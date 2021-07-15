//
//  File.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import Foundation

final class ConcreteLoginPresenter: LoginPresenter {
    
    var view: LoginView?
    
    private let router: NavigationRouter
    private let userDefaultsManager: UserDefaultsManager
    private let authenticationManager: AuthenticationManager
    
    init(dependency: LoginDependency) {
        self.router = dependency.router
        self.userDefaultsManager = dependency.userDefaultsManager
        self.authenticationManager = dependency.authenticationManager
    }
    
    func authenticate(with username: String, and password: String) {
        authenticationManager.authenticate(with: username, and: password) { [weak self] token, _ in
            guard let self = self else { return }
            
            guard let token = token else {
                self.view?.didFailToAuthenticate()
                return
            }
            
            self.userDefaultsManager.saveSession(with: token)
            self.router.navigateToCars()
        }
    }
}
