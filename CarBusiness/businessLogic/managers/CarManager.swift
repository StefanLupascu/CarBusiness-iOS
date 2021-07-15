//
//  CarManager.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 08.07.2021.
//

import Alamofire
import SwiftyJSON

final class CarManager {
    
    private let BASE_URL = "http://192.168.0.129:9090"
    private let plugin = AF
    
    func createCar(_ car: Car, completion: @escaping ApiResponse<String>) {
        let parameters: Parameters = [
            "brand": car.brand.rawValue,
            "year": car.year,
            "color": car.color,
            "horsePower": car.horsePower,
            "price": car.price
        ]
        plugin.request(BASE_URL + "/cars", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            print(response)
            
            guard let data = response.data else {
                completion(nil, response.error?.errorDescription)
                return
            }
            
            let message = String(decoding: data, as: UTF8.self)

            completion(message, nil)
        }
    }
    
    func getCars(completion: @escaping ApiResponse<[Car]>) {
        plugin.request(BASE_URL + "/cars/all", method: .get).responseJSON { response in
            guard let data = response.data else {
                completion(nil, response.error?.errorDescription)
                return
            }
            
            guard let jsonResponse = try? JSON(data: data) else {
                completion(nil, "JSON Error")
                return
            }
            
            let cars = jsonResponse.compactMap { Car(json: $0.1) }
            completion(cars, nil)
        }
    }
    
    func getCar(with id: Int, completion: @escaping ApiResponse<Car>) {
        plugin.request(BASE_URL + "/cars/\(id)", method: .get).responseJSON { response in
            guard let data = response.data else {
                completion(nil, response.error?.errorDescription)
                return
            }
            
            guard let jsonResponse = try? JSON(data: data) else {
                completion(nil, "JSON Error")
                return
            }
            
            print(jsonResponse)
            let car = Car(json: jsonResponse)
            completion(car, nil)
        }
    }
    
    func deleteCar(with id: Int, completion: @escaping ApiResponse<String>) {
        plugin.request(BASE_URL + "/cars/\(id)", method: .delete).response { response in
            print(response)
            
            guard let data = response.data else {
                completion(nil, response.error?.errorDescription)
                return
            }
            
            let message = String(decoding: data, as: UTF8.self)

            completion(message, nil)
        }
    }
    
    func updateCar(with id: Int, to car: Car, completion: @escaping ApiResponse<String>) {
        plugin.request(BASE_URL + "/cars/\(id)", method: .put).response { response in
            print(response)
            
            guard let data = response.data else {
                completion(nil, response.error?.errorDescription)
                return
            }
            
            let message = String(decoding: data, as: UTF8.self)

            completion(message, nil)
        }
    }
}
