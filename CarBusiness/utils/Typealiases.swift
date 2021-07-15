//
//  Typealiases.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import Foundation

typealias ApiResponse<T> = (_ success: T?, _ error: String?) -> Void
