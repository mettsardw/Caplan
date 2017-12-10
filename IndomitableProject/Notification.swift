//
//  Notification.swift
//  IndomitableProject
//
//  Created by Martinus on 10/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UserNotifications
import UIKit

class Notification: UIViewController{
    
    override func viewDidLoad() {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!",
                                                                arguments: nil)
        
        // Configure the trigger for a 7am wakeup.
        var dateInfo = DateComponents()
        dateInfo.hour = 21
        dateInfo.minute = 27
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in }
    }
    
}
