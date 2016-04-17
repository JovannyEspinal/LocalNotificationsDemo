//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Jovanny Espinal on 4/17/16.
//  Copyright © 2016 Jovanny Espinal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: IBAction Methods
extension ViewController {
    
    @IBAction func registerLocal(sender: UIButton)
    {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    @IBAction func scheduleLocal(sender: UIButton)
    {
        guard let settings = UIApplication.sharedApplication().currentUserNotificationSettings() else { return }
        
        if settings.types == .None {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications or we haven't asked yet.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
        }
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Test local notification works! SWIPE TO UNLOCK."
        notification.alertAction = "BE AMAZING"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}


