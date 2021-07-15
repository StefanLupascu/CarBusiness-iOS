//
//  CarDetailsView.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 09.07.2021.
//

import Foundation

protocol CarDetailsPresenterView {
    
    func didDeleteCar(with message: String)
    
    func didFailToDeleteCar(with message: String)
    
    func didUpdateCar(with message: String)
    
    func didFailToUpdateCar(with message: String)
}
