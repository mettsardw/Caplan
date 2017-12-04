//
//  DesignTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 04/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct DesignTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [DesignTasks]{
        var designTasks: [DesignTasks] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskCore")
        fetchRequest.predicate = NSPredicate(format: "name: Design")
        
        //let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
        do{
            let tasks: [TaskCore] = try container.fetch(fetchRequest) as! [TaskCore]
            //var i=0
            for task in tasks {
                print(task.value(forKey: "name") as! String)
                //let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
        
            }
        }catch _ as NSError {
            print("error")
        }
        return designTasks
    }
}
