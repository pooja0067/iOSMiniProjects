//
//  WeatherModel.swift
//  Clima
//
//  Created by Pooja Patil on 26/12/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let condtionId: Int
    let cityName: String
    let temperature: Double
    
    var getTemp: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionNames: String{
        switch condtionId {
        case 200...300:
            return "Cloud.bolt"
        case 300...400:
            return "Cloud.fog"
        case 400...500:
            return "Cloud.snow"
        case 400...900:
            return "Cloud.rain"
        default:
            return "Cloud"
        }
    }
    
}
