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
    var sprints: [Sprint]

    var name: String
    var image: UIImage?
    
    init() {
        //set with default value
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        user = User()
        sprints = []
        name = ""
        do {
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
                name = projects[0].name!
                let sprintsProject: [SprintCore] = projects[0].sprintCore?.allObjects as! [SprintCore]
                
                for sprint in sprintsProject {
                    let tasksSprint: [TaskCore] = sprint.tasks?.allObjects as! [TaskCore]
                    let insertSprint: Sprint = Sprint(name: sprint.name!)
                    
                    for task in tasksSprint{
                        let insertTask: Task = Task(name: Tasks(rawValue: task.name!)!, memberCount: Int(task.memberCount), time: Time(duration: Int(task.duration), unit: Unit(rawValue: task.durationUnit!)!))
                        insertSprint.addTask(task: insertTask)
                    }
                    sprints.append(insertSprint)
                    
                }
                
            
            
            
            
        } catch _ as NSError {
            print("error")
        }
        
        //image is optional
    }
    
    func getTasks(index: Int) -> [Task] {
        return self.sprints[index].tasks
    }
}
