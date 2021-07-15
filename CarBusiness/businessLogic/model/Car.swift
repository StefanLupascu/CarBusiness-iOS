//
//  Car.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 07.07.2021.
//

import Foundation
import SwiftyJSON

struct Car {
    
    let id: Int
    let brand: CarBrand
    let color: String
    let year: Int
    let horsePower: Int
    let price: Int
    
    init?(json: JSON) {
        let id = json["id"].int ?? 0
        let brandRawValue = json["brand"].string ?? ""
        let color = json["color"].string ?? ""
        let year = json["year"].int ?? 0
        let horsePower = json["horsePower"].int ?? 0
        let price = json["price"].int ?? 0
        guard let brand = CarBrand(rawValue: brandRawValue) else {
            return nil
        }
        
        self.id = id
        self.brand = brand
        self.color = color
        self.year = year
        self.horsePower = horsePower
        self.price = price
    }
    
    init(brand: CarBrand, color: String, horsePower: Int, year: Int, price: Int) {
        self.id = 0
        self.brand = brand
        self.color = color
        self.horsePower = horsePower
        self.year = year
        self.price = price
    }
}
