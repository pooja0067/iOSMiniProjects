//
//  ResultViewController.swift
//  TipsyBill
//
//  Created by Pooja Patil on 16/11/22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var billLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
