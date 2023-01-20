//
//  ViewController.swift
//  UnitTesting
//
//  Created by Pooja Patil on 31/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let airthObj = AirthmeticClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(airthObj.add(n1: 2, n2: 2))
        print(airthObj.sub(n1: 4, n2: 2))
        print(airthObj.mul(n1: 2, n2: 2))
        print(airthObj.dev(n1: 8, n2: 2))
    }
}

