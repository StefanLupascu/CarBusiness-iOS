//
//  ConcreteAddCarPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 11.07.2021.
//

import Foundation

final class ConcreteAddCarPresenter: AddCarPresenter {
    
    var view: AddCarPresenterView?
    
    private let router: NavigationRouter
    private let manager: CarManager
    
    init(dependency: AddCarDependency) {
        self.router = dependency.router
        self.manager = dependency.manager
    }
    
    func addCar(brand: CarBrand, color: String, horsePower: Int, year: Int, price: Int) {
        let carRequest = Car(brand: brand, color: color, horsePower: horsePower, year: year, price: price)
        manager.createCar(carRequest) { [weak self] message, error in
            guard let self = self else { return }
            
            guard let error = error else {
                self.view?.didCreateCarSuccessfully()
                return
            }
            
            self.view?.didNotCreateCar(with: error)
        }
    }
}
