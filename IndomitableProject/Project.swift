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
                        let eventsTask: [EventCore] = task.event?.allObjects as! [EventCore]
                        let insertTask: Task = Task(name: Tasks(rawValue: task.name!)!)
                        
                        for event in eventsTask{
                            let insertEvent: Event = Event(timeBoxed: Time(duration: Int(event.duration), unit: Unit(rawValue: event.durationUnit!)!), type: event.type!, memberCount: Int(event.memberCount), notes: event.notes!, point: Int(event.point))
                            insertTask.events.append(insertEvent)
                        }
                        insertSprint.addTask(task: insertTask)
                    }
                    sprints.append(insertSprint)
                    
                }
                
            
            
            
            
        } catch _ as NSError {
            print("error")
        }
        
        //image is optional
    }
    
    func getTasks(sprintIndex: Int) -> [Task] {
        return self.sprints[sprintIndex].tasks
    }
    
    func getEvents(sprintIndex: Int) -> [Event] {
        var events: [Event] = []
        for task in sprints[sprintIndex].tasks {
            for event in task.events{
                events.append(event)
            }
        }
        return events
    }
}
