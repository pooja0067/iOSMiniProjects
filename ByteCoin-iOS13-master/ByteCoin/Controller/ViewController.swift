//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var bitcoinCurrency: UILabel!
    @IBOutlet weak var bitcoinPickerView: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        bitcoinPickerView.dataSource = self
        bitcoinPickerView.delegate = self
    }


}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let coinPrice = coinManager.currencyArray[row]
        bitcoinCurrency.text = coinPrice
        coinManager.getCoinPrice(for: coinPrice)
    }
}

extension ViewController: CoinManagerDelegateProtocol {
    
    func getGetCurrencyAmount(with amt: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = amt
        }
    }
    
    func didGetError(with error: Error) {
        print(error)
    }
    
    
}
