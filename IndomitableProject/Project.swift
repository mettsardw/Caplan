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
                let insertSprint: Sprint = Sprint(name: sprint.name!, objectID: String(describing: sprint.objectID))
                
                let totalDay: Int = Int(sprint.duration)
                var totalTask: Int = 0
                
                for task in tasksSprint{
                    
                    let eventsTask: [EventCore] = task.event?.allObjects as! [EventCore]
                    let insertTask: Task = Task(name: Tasks(rawValue: task.name!)!)
                    var totalReq = 0
                    var totalCoding = 0
                    var totalTesting = 0
                    var dayLeft = totalDay
                    var tempDuration: [Int] = []
                    var tempDurationUnit: [String] = []
                    var tempType: [String] = []
                    var tempMemberCount: [Int] = []
                    var tempNotes: [String] = []
                    var tempPoint: [Int] = []
                    for event in eventsTask{
                        if event.taskEvent?.name == "Requirement" || event.taskEvent?.name == "Design" {
                            totalReq += 1
                        }else if event.taskEvent?.name == "Coding" {
                            totalCoding += 1
                        }else if event.taskEvent?.name == "Testing" {
                            totalTesting += 1
                        }
                        totalTask += 1
                    }
                    
                    
                    for event in eventsTask{
                        var duration = 0
                        if event.taskEvent?.name == "Requirement" || event.taskEvent?.name == "Design" {
                            duration = (totalDay / 2) / totalReq
                        }else if event.taskEvent?.name == "Coding" {
                            duration = (totalDay * 30 / 100) / totalCoding
                        }else if event.taskEvent?.name == "Testing" {
                            duration = (totalDay * 20 / 100) / totalTesting
                        }
                        tempDuration.append(duration)
                        tempType.append(event.type!)
                        tempNotes.append(event.notes!)
                        tempMemberCount.append(Int(event.memberCount))
                        tempDurationUnit.append(event.durationUnit!)
                        tempPoint.append(Int(event.point))
                        dayLeft -= duration
                        
                        
                    }
                    print("day left: \(dayLeft)")
                    if dayLeft > 0 && eventsTask.count != 0 {
                        let addBonusTime = dayLeft / eventsTask.count
                        for i in 0..<tempDuration.count {
                            tempDuration[i] += addBonusTime
                            dayLeft -= addBonusTime
                        }
                    }
                    for i in 0..<tempDuration.count {
                        let insertEvent: Event = Event(timeBoxed: Time(duration: tempDuration[i], unit: Unit(rawValue: tempDurationUnit[i])!), type: tempType[i], memberCount: tempMemberCount[i], notes: tempNotes[i], point: tempPoint[i])
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
