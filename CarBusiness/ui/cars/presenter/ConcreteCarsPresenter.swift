//
//  ConcreteCarsPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 08.07.2021.
//

import Foundation

final class ConcreteCarsPresenter: CarsPresenter {    
    
    var view: CarsPresenterView?
    
    private let router: NavigationRouter
    private let manager: CarManager
    private var viewModel: CarsViewModel
    
    init(dependency: CarsDependency) {
        self.router = dependency.router
        self.manager = dependency.manager
        self.viewModel = dependency.viewModel
    }
    
    func getCars() {
        manager.getCars() { [weak self] carsResponse, error in
            guard let cars = carsResponse else {
                self?.view?.failedToRetrieveCars()
                return
            }
            self?.viewModel.updateCars(with: cars)
            self?.view?.didReceiveCars()
        }
    }
    
    func getCar(with id: Int) {
        manager.getCar(with: id) { [weak self] car, error in
            guard let carDetails = car else {
                return
            }
    
            self?.view?.didReceiveCar(carDetails)
        }
    }
    
    func presentCar(with details: Car) {
        router.navigateToCar(with: details)
    }
    
    func presentAddCar() {
        router.navigateToAddCar()
    }
}
