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
            
            for sprint in projectSprints {
                let sprintTask: [TaskCore] = sprint.tasks?.allObjects as! [TaskCore]
                for task in sprintTask{
                    let taskEvent: [EventCore] = task.event?.allObjects as! [EventCore]
                    if task.name == "Coding"{
                        for index in 0..<taskEvent.count{
                            codingTasks.append(CodingTasks(day: String(describing: taskEvent[index].duration), event:   taskEvent[index].type!))
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

