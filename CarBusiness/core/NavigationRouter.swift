//
//  Router.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import UIKit

final class NavigationRouter {
    
    private let window: UIWindow
    private let appCore: AppCore
    
    private var navigationController: CarBusinessNavigationController?
    
    init(window: UIWindow, appCore: AppCore) {
        self.window = window
        self.appCore = appCore
    }
    
    func navigateToLogin() {
        let viewModel = LoginViewModel()
        let presenter = ConcreteLoginPresenter(dependency: LoginDependency(router: self, userDefaultsManager: appCore.userDefaultsManager, authenticationManager: appCore.authenticationManager))
        let viewController = LoginViewController(viewModel: viewModel, presenter: presenter)
        
        navigationController = CarBusinessNavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
    }
    
    func navigateToCars() {
        let viewModel = CarsViewModel()
        let presenter = ConcreteCarsPresenter(dependency: CarsDependency(router: self, manager: appCore.carManager, viewModel: viewModel))
        let viewController = CarsViewController(viewModel: viewModel, presenter: presenter)
        
        navigationController = CarBusinessNavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
    }
    
    func navigateToCar(with details: Car) {
        let viewModel = CarDetailsViewModel(carDetails: details)
        let presenter = ConcreteCarDetailsPresenter(dependency: CarDetailsDependency(router: self, manager: appCore.carManager, viewModel: viewModel))
        let viewController = CarDetailsViewController(viewModel: viewModel, presenter: presenter)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToAddCar() {
        let viewModel = AddCarViewModel()
        let presenter = ConcreteAddCarPresenter(dependency: AddCarDependency(router: self, manager: appCore.carManager))
        let viewController = AddCarViewController(viewModel: viewModel, presenter: presenter)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
