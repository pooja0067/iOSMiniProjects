//
//  SecondViewController.swift
//  localnoti
//
//  Created by Pooja Patil on 14/10/22.
//  Copyright © 2022 pooja. All rights reserved.
//

import UIKit
import Foundation


class SecondViewController: UIViewController
{
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBAction func ButtonTwoAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
