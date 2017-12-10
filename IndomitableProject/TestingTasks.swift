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
    var task: String
    var day: String
    var event: String
    var memberCount: String
    var note: String
    
    static func fetchData() -> [TestingTasks]{
        var testingTasks: [TestingTasks] = []
        
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
                    let temptask = task.name
                    let taskEvent: [EventCore] = task.event?.allObjects as! [EventCore]
                    if task.name == "Testing"{
                        for index in 0..<taskEvent.count{
                            testingTasks.append(TestingTasks(task: temptask!, day: String(describing: taskEvent[index].duration), event:   taskEvent[index].type!, memberCount: String(taskEvent[index].memberCount), note: taskEvent[index].notes!))
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

