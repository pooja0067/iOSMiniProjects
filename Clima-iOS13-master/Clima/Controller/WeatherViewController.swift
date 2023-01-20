//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    //MARK: - Global variables
    var weather = weatherManager()
    let location = CLLocationManager()
    
     //MARK: - IBOutlets
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - Lifecyacle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.delegate = self
        
        location.requestWhenInUseAuthorization()
        location.requestLocation()
        
        weather.delegate = self
        searchTextField.delegate = self
    }

}

//MARK: - UItextfiled delegates

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchAction(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.text!
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type something!"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weather.getWeatherData(cityName: city)
        }
    }
}

//MARK: - Weather delegates
extension WeatherViewController: WeatherDataDelegate {
    func didUpdateTheweather(wManager weather: weatherManager, wData: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = wData.getTemp
            self.conditionImageView.image = UIImage(named: wData.conditionNames)
        }
    }
    
    func didValidateError(error: Error) {
        print(error)
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("got a location")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
