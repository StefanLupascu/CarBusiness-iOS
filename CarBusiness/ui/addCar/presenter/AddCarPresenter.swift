//
//  AddCarPresenter.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 11.07.2021.
//

import Foundation

protocol AddCarPresenter {
    
    var view: AddCarPresenterView? { get set }
    
    func addCar(brand: CarBrand, color: String, horsePower: Int, year: Int, price: Int)
}
