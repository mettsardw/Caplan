//
//  DesignTasks2.swift
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
    
        //get data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        
        do{
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as![SprintCore]
            
            for i in 0..<projectSprints.count{
                let sprintTasks: [TaskCore] = projectSprints[i].tasks?.allObjects as! [TaskCore]
            
                if sprintTasks.count > 1{
                    let taskEvents: [EventCore] = sprintTasks[1].event?.allObjects as! [EventCore]
            
                    for sprintTask in sprintTasks{
                        if sprintTask.name == "Design"{
                            for index in 0..<taskEvents.count{
                                designTasks.append(DesignTasks(day: String(describing: taskEvents[index].duration), event:   taskEvents[index].type!))
                            }
                        }
                    }
                }
            }
            
        }catch _ as NSError {
            print("error")
        }
        return designTasks
    }
}
