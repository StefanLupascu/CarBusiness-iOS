//
//  CarDetailsViewModel.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 09.07.2021.
//

import Foundation

final class CarDetailsViewModel {
    
    let deleteText = "Delete"
    let updateText = "Update"
    let failedToDeleteCarText = "Failed to delete car!"
    let failedToUpdateCarText = "Failed to update car!"
    
    var carDetails: Car
    
    init(carDetails: Car) {
        self.carDetails = carDetails
    }
    
    func getHorsePowerText() -> String {
        "Power: \(carDetails.horsePower)hp"
    }
    
    func getYearText() -> String {
        "Year \(carDetails.year)"
    }
    
    func getPriceText() -> String {
        "Price: \(carDetails.price)euro"
    }
}
