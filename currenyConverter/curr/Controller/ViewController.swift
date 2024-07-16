//
//  ViewController.swift
//  curr
//
//  Created by Pooja Patil on 09/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    var getType: String = ""
    var getAmount: String = ""
    var toConvert: String = ""
    var finalOutPut : Double = 0.0
    var countryCurrencyList: [CountryCurrency] = []
    var pickerView = UIPickerView()
    
    @IBOutlet weak var currenyType: UITextField!
    @IBOutlet weak var currenyAmount: UITextField!
    @IBOutlet weak var convertingTypeCurreny: UITextField!
    @IBOutlet weak var resultData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        getType = currenyType.text ?? "USD"
        getAmount = currenyAmount.text ?? "1"
        toConvert = convertingTypeCurreny.text ?? "INR"
        currenyType.inputView = pickerView
        convertingTypeCurreny.inputView = pickerView
        setUpView()
        self.getAPIData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let formattedString = String(format: "%.2f", self.finalOutPut)
            self.resultData.text = "\(self.getAmount) \(self.getType) = \(formattedString) \(self.toConvert)"
        })
    }
    
    func loadCountryCurrencyData() {
        guard let url = Bundle.main.url(forResource: "currencyData", withExtension: "json") else {
            print("countryCurrency.json file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            // Decode the array of CountryCurrency objects
            countryCurrencyList = try decoder.decode([CountryCurrency].self, from: data)
            
            // Filter out entries where currency_code is nil
            // countryCurrencyList = countryCurrencyList.filter { $0.currencyCode != nil }
            
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
    
    func setUpView() {
        loadCountryCurrencyData()
        setUpPickuPdone()
    }
    
    func setUpPickuPdone() {
        // Set up toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: false)
        
        // Set input accessory view of currencyType to toolbar
        currenyType.inputAccessoryView = toolbar
        convertingTypeCurreny.inputAccessoryView = toolbar
        
        // Layout constraints
        currenyType.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    @objc func doneButtonTapped() {
        // Dismiss the picker view
        view.endEditing(true)
    }
    
    
    func getAPIData() {
        if let url = URL(string: "https://open.er-api.com/v6/latest/\(getType)") {
            // Create the URL Request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            // Create the Data Task
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                // Handle the Response
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Error: Invalid response")
                    return
                }
                
                if let data = data {
                    do {
                        // Decode the JSON data directly into the Currency struct
                        let exchangeRates = try JSONDecoder().decode(Currency.self, from: data)
                        if let rate = exchangeRates.rates[self.toConvert] {
                            let result = rate * (Double(self.getAmount) ?? 0.0)
                            self.finalOutPut = result
                        } else {
                            print("data not found")
                        }
                    } catch {
                        print("Error: Unable to parse JSON - \(error.localizedDescription)")
                    }
                }
            }
            
            // Start the Data Task
            task.resume()
        }
    }
    
    func getCurrencyType(type: String) -> String {
        return type
    }
    
    func getCurrencyAmount(amount: String) -> String {
        return amount
    }
    
    func getCurrencyConvert(convert: String) -> String {
        return convert
    }
    
    @IBAction func convertCurrency(_ sender: UIButton) {
        if let currencyAmount = currenyAmount.text, !currencyAmount.isEmpty {
            getAmount = self.getCurrencyAmount(amount: currencyAmount)
        }
        self.getAPIData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let formattedString = String(format: "%.2f", self.finalOutPut)
            self.resultData.text = "\(self.getAmount) \(self.getType) = \(formattedString) \(self.toConvert)"
        })
    }
}

extension  ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // UIPickerViewDataSource Methods
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCurrencyList.count
    }
    
    // UIPickerViewDelegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryCurrencyList[row].currencyCode
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCountryCurrency = countryCurrencyList[row]
        if currenyType.isFirstResponder {
            currenyType.text = selectedCountryCurrency.currencyCode
            getType = selectedCountryCurrency.currencyCode
        } else if convertingTypeCurreny.isFirstResponder {
            convertingTypeCurreny.text = selectedCountryCurrency.currencyCode
            toConvert = selectedCountryCurrency.currencyCode
        }
    }
}

