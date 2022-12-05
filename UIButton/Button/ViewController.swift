//
//  ViewController.swift
//  Button
//
//  Created by Pooja Patil on 12/10/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var changeColour: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var binDict = ["bin1": 9, "bin2":3, "bin3":6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColour.backgroundColor = .black
        label1.text = "1"
        label2.text = "2"
    }
    
    @IBAction func imageButtonaction(_ sender: Any) {
        imageView.image = [UIImage.add, UIImage.checkmark, UIImage.remove][Int.random(in: 0...2)]
    }
    
    @IBAction func changeColourAction(_ sender: Any) {
        changeColour.backgroundColor = .red
        label1.text = ["P","O","O","J","A","R"][Int.random(in: 0...4)]
        label2.text = ["P","A","T","I","L","G"][Int.random(in: 0...4)]
    }
    
}

