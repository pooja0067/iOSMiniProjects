//
//  ViewController.swift
//  Menu123
//
//  Created by Pooja Patil on 06/08/20.
//  Copyright © 2020 pooja. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    

    
    var menuout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
             
        
    }
    @IBAction func menu_run(_ sender: Any) {
    
        if menuout == false
        {
            leading.constant = 250
            trailing.constant = -250
            menuout = true
        }
        else{
            leading.constant = 0
            trailing.constant = 0
            menuout = false
        }
        
    }
    

}



