//
//  CarsPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 08.07.2021.
//

import Foundation

protocol CarsPresenter {
    
    var view: CarsPresenterView? { get set }
    
    func getCars()
    
    func getCar(with id: Int)
    
    func presentCar(with details: Car)
    
    func presentAddCar()
}
