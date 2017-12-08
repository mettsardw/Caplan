//
//  CodingTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct CodingTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [CodingTasks]{
        var codingTasks: [CodingTasks] = []
        
        //get data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        do{
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as![SprintCore]
            
            for i in 0..<projectSprints.count{
                let sprintTasks: [TaskCore] = projectSprints[i].tasks?.allObjects as! [TaskCore]
            
                if sprintTasks.count > 2{
                    let taskEvents: [EventCore] = sprintTasks[2].event?.allObjects as! [EventCore]
                    
                    for sprintTask in sprintTasks{
                        if sprintTask.name == "Coding"{
                            for index in 0..<taskEvents.count{
                                codingTasks.append(CodingTasks(day: String(describing: taskEvents[index].duration), event:   taskEvents[index].type!))
                            }
                        }
                    }
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return codingTasks
    }
}

