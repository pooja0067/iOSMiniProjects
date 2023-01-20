//
//  WeatherData.swift
//  Clima
//
//  Created by Pooja Patil on 21/12/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: tempType
    let weather: [weatherType]
}

struct tempType: Decodable {
    let temp: Double
    let pressure: Int
}

struct weatherType: Decodable {
    let description: String
    let id: Int
}
