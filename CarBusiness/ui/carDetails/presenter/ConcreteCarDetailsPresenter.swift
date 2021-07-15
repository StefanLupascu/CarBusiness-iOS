//
//  ConcreteCarDetailsPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 09.07.2021.
//

import Foundation

final class ConcreteCarDetailsPresenter: CarDetailsPresenter {
    
    var view: CarDetailsPresenterView?
    
    private let router: NavigationRouter
    private let manager: CarManager
    private var viewModel: CarDetailsViewModel
    
    init (dependency: CarDetailsDependency) {
        self.router = dependency.router
        self.manager = dependency.manager
        self.viewModel = dependency.viewModel
    }
    
    func deleteCar(with id: Int) {
        manager.deleteCar(with: id) { [weak self] message, error in
            guard let self = self else { return }
            
            guard let message = message else {
                self.view?.didFailToDeleteCar(with: error ?? "")
                return
            }
            self.view?.didDeleteCar(with: message)
        }
    }
    
    func updateCar(with id: Int, to car: Car) {
        manager.updateCar(with: id, to: car) { [weak self] message, error in
            guard let self = self else { return }
            
            guard let message = message else {
                self.view?.didFailToUpdateCar(with: error ?? "")
                return
            }
            self.view?.didUpdateCar(with: message)
        }
    }
}
