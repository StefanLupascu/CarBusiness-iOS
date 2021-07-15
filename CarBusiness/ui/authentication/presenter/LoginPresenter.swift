//
//  LoginPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import Foundation
protocol LoginPresenter {
    
    var view: LoginView? { get set }
    
    func authenticate(with username: String, and password: String)
}
