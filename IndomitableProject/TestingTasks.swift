//
//  TestingTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct TestingTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [TestingTasks]{
        var testingTasks: [TestingTasks] = []
        
        //get data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        do{
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as![SprintCore]
            
            for sprint in projectSprints{
                let sprintTasks: [TaskCore] = sprint.tasks?.allObjects as! [TaskCore]
                for task in sprintTasks{
                    let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
                    for sprintTask in sprintTasks{
                        if sprintTask.name == "Testing"{
                            for index in 0..<taskEvents.count{
                                testingTasks.append(TestingTasks(day: String(describing: taskEvents[index].duration), event:   taskEvents[index].type!))
                            }
                        }
                    }
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return testingTasks
    }
}

