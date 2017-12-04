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
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Design")
        
        do{
            let designs: [TaskCore] = try container.fetch(fetchRequest) as! [TaskCore]
           
            for design in designs {
                let taskEvents: [EventCore] = design.event?.allObjects as! [EventCore]
                
                for index in 0..<taskEvents.count{
                    designTasks.append(DesignTasks(day: String(describing: taskEvents[index].time?.duration), event: taskEvents[index].type!))
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return designTasks
    }
}
