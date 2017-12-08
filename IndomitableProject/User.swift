//
//  User.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData
class User {
    var name: String
    var accounts: [String]
    //    var point: Int
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        let userFetch = NSFetchRequest<NSManagedObject>(entityName: "UserCore")
        name = ""
        accounts = []
        do {
            let users: [UserCore] = try container.fetch(userFetch) as! [UserCore]
            name = users[0].name!
            accounts.append(users[0].account!)
        } catch _ as NSError {
            print("error")
        }
        
    }
}
