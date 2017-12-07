//
//  RequirementTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct RequirementTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [RequirementTasks]{
        var requirementTasks: [RequirementTasks] = []
        
        //get data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        do{
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as![SprintCore]
            let sprintTasks: [TaskCore] = projectSprints[0].tasks?.allObjects as! [TaskCore]
            
            if sprintTasks.count > 0{
                let taskEvents: [EventCore] = sprintTasks[0].event?.allObjects as! [EventCore]
            
                for sprintTask in sprintTasks{
                    if sprintTask.name == "Requirement"{
                        for index in 0..<taskEvents.count{
                            requirementTasks.append(RequirementTasks(day: String(describing: taskEvents[index].duration), event:   taskEvents[index].type!))
                        }
                    }
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return requirementTasks
    }
}

