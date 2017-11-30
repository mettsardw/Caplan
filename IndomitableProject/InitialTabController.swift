//
//  InitialTabController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class InitialTabController: UITabBarController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("first")
        let container = appDelegate.persistentContainer.viewContext
        let taskEntity = NSEntityDescription.entity(forEntityName: "TaskCore", in: container)
        let eventEntity = NSEntityDescription.entity(forEntityName: "EventCore", in: container)
        let newTask = NSManagedObject(entity: taskEntity!, insertInto: container)
        let newEvent = NSManagedObject(entity: eventEntity!, insertInto: container)
        newTask.setValue("Requirement", forKey: "name")
        
        newTask.mutableSetValue(forKey: "event").add(newEvent)
        //newTask.objectIDs(forRelationshipNamed: "event
        
        manageProject()
        let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
        do{
            let tasks: [NSManagedObject] = try container.fetch(taskFetch)
            for task in tasks {
                print("name: \(task.value(forKey: "name") as! String)")
                //print(task.objectIDs(forRelationshipNamed: "event").count)
                
            }
        }catch let error as NSError {
            print("error")
        }
    }
}

//manage projects globally
var project: Project = Project()

func manageProject(){
    //initialize project, tasks.
    let plan: Plan = Plan(name: "Planning")
    //var plan2: Plan = Plan(name: "Sprinting")
    plan.addTask(task: Task(name: .Requirement, memberCount: 1, time: Time(duration: 10, unit: .days)))
    plan.addTask(task: Task(name: .Design, memberCount: 1, time: Time(duration: 5, unit: .days)))
    plan.addTask(task: Task(name: .Coding, memberCount: 1, time: Time(duration: 7, unit: .days)))

    project.schedule.plans.append(plan)
}

func taskToIndicateEndOfProject() -> Task{
    return Task(name: .Review, memberCount: 0, time: Time(duration: 0, unit: .days))
}

