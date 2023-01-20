//
//  FirstViewController.swift
//  localnoti
//
//  Created by Pooja Patil on 13/10/22.
//  Copyright © 2022 pooja. All rights reserved.
//

import UIKit
import Foundation


class FirstViewController: UIViewController
{
    @IBOutlet weak var labelOne: UILabel!
    
    @IBAction func btnclickTwo(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
