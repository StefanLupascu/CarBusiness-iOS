//
//  CarsPresenterView.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 08.07.2021.
//

import Foundation

protocol CarsPresenterView {
    
    func didReceiveCars()
    
    func failedToRetrieveCars()
    
    func didReceiveCar(_ carDetails: Car)
}
