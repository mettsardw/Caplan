//
//  Project.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Project {
    var user: User
    var schedule: Schedule
    var name: String
    var image: UIImage?
    
    init() {
        //set with default value
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        user = User()
        schedule = Schedule()
        name = ""
        do {
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            name = projects[0].name!
        } catch _ as NSError {
            print("error")
        }
        
        //image is optional
    }
    
    func getTasks(index: Int) -> [Task] {
        return self.schedule.plans[index].tasks
    }
}
