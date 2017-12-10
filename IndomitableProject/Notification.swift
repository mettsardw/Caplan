//
//  Notification.swift
//  IndomitableProject
//
//  Created by Martinus on 06/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import UserNotifications

class Notification: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //ini yang munculin notif gk pake tombol. auto
        
        let content = UNMutableNotificationContent()
        content.title = "Hello World"
        content.subtitle = "Hello World, How are you?"
        content.body = "Hello World, what shold i do today?"
        content.badge = 1
        
        var dateComponent = DateComponents()
        dateComponent.day = 10
        dateComponent.hour = 6
        dateComponent.minute = 2
        
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        UNUserNotificationCenter.current().requestAuthorization(options:  [.alert, .sound, .badge], completionHandler:{didAllow, error in})
    }
    
    func getDay(){
        
    }
    
    func getHour(){
        
    }
    
    func getMinute(){
        
    }
}
