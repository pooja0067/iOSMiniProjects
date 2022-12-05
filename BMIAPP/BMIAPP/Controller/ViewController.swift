//
//  ViewController.swift
//  BMIAPP
//
//  Created by Pooja Patil on 11/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculate = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        goToNextVC()
    }
    
    func goToNextVC() {
        let calculatedValue = calculate.calculate(heightSlider.value, weightSlider.value)
        let res = String(format: "%0.f", calculatedValue)
        let secondVc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVc.bmiVal = res
        secondVc.colorVal = calculate.colour
        secondVc.modalPresentationStyle = .fullScreen
        self.present(secondVc, animated: true, completion: nil)
    }
}

