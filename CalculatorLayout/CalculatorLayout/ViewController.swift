//
//  ViewController.swift
//  CalculatorLayout
//
//  Created by Pooja Patil on 20/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        let buttonName = sender.currentTitle ?? ""
        switch buttonName {
        case "+": print("")
        default:
            break
        }
    }
    


}

