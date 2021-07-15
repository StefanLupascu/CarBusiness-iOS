//
//  CarsViewModel.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 07.07.2021.
//

import Foundation

final class CarsViewModel {
    
    let navigationBarTitle = "Available Cars"
    let carsRetrievalFailed = "Failed to retrieve cars"
    
    var cars = [Car]()
    
    func getCarCellModels() -> [CarCellModel] {
        return cars.map { CarCellModel(brand: $0.brand.getBrand(), year: $0.year) }
    }
    
    func updateCars(with cars: [Car]) {
        self.cars = cars
    }
}
