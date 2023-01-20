//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegateProtocol {
    func getGetCurrencyAmount(with amt: String)
    func didGetError(with error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    let apiKey = "B82D9B0E-66FE-45E8-885E-1358763C2A66"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegateProtocol?
    
    func getCoinPrice(for currency: String) {
        let currencyURL = "\(baseURL)/\(currency)?apiKey=\(apiKey)"
        print(currencyURL)
        performRequest(with: currencyURL)
    }
    
    func performRequest(with url: String) {
        let url = URL(string: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, urlResponse, error in
            if error != nil {
                delegate?.didGetError(with: error!)
                return
            }
            if let setData = data {
                if let bitcoinPrice = self.parseJSON(with: setData) {
                    let price = String(format: "%.2f", bitcoinPrice)
                    print(price)
                    delegate?.getGetCurrencyAmount(with: price)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(with data: Data)-> Double? {
        let decoder = JSONDecoder()
        do {
        let decodeData = try decoder.decode(CoinData.self, from: data)
            let currencyAMT = decodeData.rate
            print(currencyAMT)
            return currencyAMT
        } catch {
            delegate?.didGetError(with: error)
            return nil
        }
    }
}
