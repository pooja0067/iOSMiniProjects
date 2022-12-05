//
//  SecondViewController.swift
//  BMIAPP
//
//  Created by Pooja Patil on 11/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiValue: UILabel!
    var bmiVal = "0.0"
    var colorVal : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiValue.text = bmiVal
        view.backgroundColor = colorVal
    }
    
    @IBAction func reCalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
