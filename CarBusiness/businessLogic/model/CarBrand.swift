//
//  CarBrand.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 07.07.2021.
//

import Foundation

enum CarBrand: String, CaseIterable {
    case BMW, AUDI, MERCEDES_BENZ, VOLKSWAGEN, OPEL, FORD
    
    func getBrand() -> String {
        switch self {
        case .BMW:
            return "Bmw"
        case .AUDI:
            return "Audi"
        case .MERCEDES_BENZ:
            return "Mercedes-Benz"
        case .VOLKSWAGEN:
            return "Volkswagen"
        case .OPEL:
            return "Opel"
        case .FORD:
            return "Ford"
        }
    }
}
