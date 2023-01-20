//
//  WeatherModel.swift
//  Clima
//
//  Created by Pooja Patil on 09/12/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherDataDelegate {
    func didUpdateTheweather(wManager: weatherManager, wData: WeatherModel)
    func didValidateError(error: Error)
}

struct weatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fc9e4f8f73e7dc5c0378b054270f7064&units=metric"
    
    var delegate: WeatherDataDelegate?
    
    func getWeatherData(cityName: String){
        let weather = "\(weatherURL)&q=\(cityName)"
        print(weather)
        createURL(str: weather)
    }
    
    func createURL(str: String) {
        //1.create a URL
        if let url = URL(string: str) {
            //2.Create a URLSession
            let session = URLSession(configuration: .default)
            //3.Give a session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didValidateError(error: error!)
                    return
                }
                if let setdata = data {
//                    let dataString = String(data: setdata, encoding: .utf8)
                    if let data1 = self.weatherInfo(wData: setdata) {
                        self.delegate?.didUpdateTheweather(wManager: self, wData: data1)
                    }
                }
            }
            //4.Start a task
            task.resume()
        }
    }
    
    func weatherInfo(wData: Data)-> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: wData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weData = WeatherModel(condtionId: id, cityName: name, temperature: temp)
            print(weData.getTemp)
            return weData
            
        } catch {
            delegate?.didValidateError(error: error)
            return nil
        }
    }
}
