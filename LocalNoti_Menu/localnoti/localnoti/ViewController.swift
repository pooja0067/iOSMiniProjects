//
//  ViewController.swift
//  localnoti
//
//  Created by Pooja Patil on 05/08/20.
//  Copyright © 2020 pooja. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController , UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    var storeStateForButton1: Bool?
    var storeStateForButton2: Bool?
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert , .badge , .sound]) { (success, error) in
        }
    }
    
    @IBAction func btnclickOne(_ sender: UIButton) {
        storeStateForButton1 = buttonOne.isTouchInside
        storeStateForButton2 = buttonTwo.isTouchInside
        sendLocalNotification()
    }
    
    func sendLocalNotification() {
        let content = UNMutableNotificationContent()
        if storeStateForButton1 == true {
            content.categoryIdentifier = "ONE"
            content.title = "Notification one received"
            content.body = "Ravi u got notification 1"
        } else if storeStateForButton2 == true {
            content.categoryIdentifier = "TWO"
            content.title = "Notification two received"
            content.body = "Ravi u got notification 2"
        }
        content.badge = 1
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 2, repeats: false)
        let identifier = "main identifier"
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            //print("\(error?.localizedDescription)")
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
//        if storeStateForButton1 == true {
//            goToFirstViewController()
//        } else if storeStateForButton2 == true {
//            goToSecondViewController()
//        }
        
        //based on notification category
        let notification_type = response.notification.request.content.categoryIdentifier
       if notification_type == "ONE" {
           goToFirstViewController()
       } else if notification_type == "TWO" {
           goToSecondViewController()
       }
    }
    
    func goToFirstViewController() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "FirstViewController", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func goToSecondViewController() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SecondViewController", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func player(sender: UIButton){
        switch (sender){
        case buttonOne:
            goToFirstViewController()
        case buttonTwo:
            goToSecondViewController()
        default:
            break
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert ,.badge ,.sound])
    }
    
}
