//
//  CarDetailsPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 09.07.2021.
//

import Foundation

protocol CarDetailsPresenter {
    
    var view: CarDetailsPresenterView? { get set }
    
    func deleteCar(with id: Int)
    
    func updateCar(with id: Int, to car: Car)
}
