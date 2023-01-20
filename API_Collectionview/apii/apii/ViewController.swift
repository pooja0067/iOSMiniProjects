//
//  ViewController.swift
//  apii
//
//  Created by Pooja Patil on 16/07/20.
//  Copyright © 2020 pooja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getPressed(_ sender: UIButton)
    {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response
            {
                print("response is",response)
            }
            if let data = data
            {
                print("data is",data)
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch
                {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func postPressed(_ sender: Any) {
        
        
        let parameters = ["username":"@kilo_io" , "tweet":"hello"]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return }
        
        request.httpBody = httpBody
        
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let response = response
            {
                print(response)
            }
            if let data = data
            {
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }
                catch
                {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    //new example
    
    var arrData = [arrayData]()
    
    override func viewDidLoad() {
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            do {
                if error == nil {
                    self.arrData = try JSONDecoder().decode([arrayData].self, from: data!)
                    for a in self.arrData {
                        print("data is ", a.name)
                    }
                }
            } catch {
                print("error to fetch data")
            }
        }
    }

}

struct arrayData: Decodable {
    let name:String
    let capital:String
}

