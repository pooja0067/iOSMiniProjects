//
//  CurrencyModel.swift
//  curr
//
//  Created by Pooja Patil on 09/07/24.
//

import Foundation

struct Currency: Codable {
    let rates: [String : Double]
}


struct CountryCurrency: Codable {
    let country: String
    let currencyCode: String
}
