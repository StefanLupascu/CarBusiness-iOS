//
//  AddCarPresenterView.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 11.07.2021.
//

import Foundation

protocol AddCarPresenterView {
    
    func didCreateCarSuccessfully()
    
    func didNotCreateCar(with message: String)
}
