//
//  ViewController.swift
//  TipsyBill
//
//  Created by Pooja Patil on 16/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextfield: UITextField!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var billCountLabel: UILabel!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "goto", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goto" {
            let destinationvc = segue.destination as! ResultViewController
            
        }
    }
    
}

