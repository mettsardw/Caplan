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
    var task: String
    var day: String
    var event: String
    var memberCount: String
    var note: String
    
    static func fetchData() -> [DesignTasks]{
        var designTasks: [DesignTasks] = []
    
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
                    if task.name == "Design"{
                        for index in 0..<taskEvent.count{
                            designTasks.append(DesignTasks(task: sprintTask[index].name!, day: String(describing: taskEvent[index].duration), event:   taskEvent[index].type!, memberCount: String(taskEvent[index].memberCount), note: taskEvent[index].notes!))
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
