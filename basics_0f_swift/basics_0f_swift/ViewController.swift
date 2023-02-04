//
//  ViewController.swift
//  basics_0f_swift
//
//  Created by Pooja Patil on 17/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //passing data using Notification center
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(notification:)), name: Notification.Name("text"), object: nil)
    }
    //data passing using notification center
    @objc func didGetNotification(notification: Notification) {
        let text = notification.object as! String
        titleLabel.text = text
    }
    
    @IBAction func passDataAction(_ sender: UIButton) {
        let vc =  storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.modalPresentationStyle = .fullScreen
        vc.compliation = { text in
            self.titleLabel.text = text
        }
        self.present(vc,animated: true, completion: nil)
    }
}

