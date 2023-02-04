//
//  SecondViewController.swift
//  basics_0f_swift
//
//  Created by Pooja Patil on 18/08/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondaryTextField: UITextField!
    
    //compeation handlers
    var compBlock: ((Bool) -> Void) = {
        if $0 {
            print("dowloading is done")
        }
    }
    
    public var compliation: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //compleation -handlers
        createCompHandler(complete: compBlock)
    }

    func createCompHandler(complete:(Bool)-> ()) {
        for i in 1...5 {
            print("downloading", i)
        }
        compBlock(true)
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        //compliation?(secondaryTextField.text ?? "")
        NotificationCenter.default.post(name: Notification.Name("text"), object: secondaryTextField.text)
        dismiss(animated: true, completion: nil)
    }
}
