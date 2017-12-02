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
        //let newTask = NSManagedObject(entity: taskEntity!, insertInto: container)
        //let newEvent = NSManagedObject(entity: eventEntity!, insertInto: container)
       
        let newTask = TaskCore(entity: taskEntity!, insertInto: container)
        let newEvent = EventCore(entity: eventEntity!, insertInto: container)
        let newEvent1 = EventCore(entity: eventEntity!, insertInto: container)
        let newEvent2 = EventCore(entity: eventEntity!, insertInto: container)
        newTask.setValue("Requirement", forKey: "name")
//        newTask.setValue("Design", forKey: "name")
//        newTask.setValue("Coding", forKey: "name")
//        newTask.setValue("Testing", forKey: "name")
//        newTask.setValue("Requirement", forKey: "name")
//        newTask.setValue("Requirement", forKey: "name")
        newEvent.setValue("Gather Data", forKey: "type")
        newEvent1.setValue("Market Data", forKey: "type")
        newEvent2.setValue("requirement analyst", forKey: "type")
        //tipe data Int Masih bug
        newEvent.setValue(6, forKey: "memberCount")
        newEvent1.setValue(Int("6"), forKey: "memberCount")
        newEvent2.setValue(Int("6"), forKey: "memberCount")
        newTask.addToEvent(newEvent)
        newTask.addToEvent(newEvent2)
        newTask.addToEvent(newEvent1)
        
        //newTask.mutableSetValue(forKey: "event").add(newEvent)
        //newTask.objectIDs(forRelationshipNamed: "event
    
        manageProject()
        let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
        do{
            let tasks: [NSManagedObject] = try container.fetch(taskFetch)
            for task in tasks {
                print("name: \(task.value(forKey: "name") as! String)")
                //get NSSet to String
                guard let taskEvent = newTask.event?.value(forKeyPath: "memberCount") else {print("no event");return}
                print(taskEvent)
                //
                let taskEventDataValue = getStringFromNSSet(data: taskEvent)
                print(taskEventDataValue[0])
                //print(taskEventDataValue[1])
                //print(taskEventDataValue[2])
               
                
            }
        }catch _ as NSError {
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


//created by Dargoz
func getStringFromNSSet(data:Any) -> [String] {
    var dataSet = String(describing: data)
    var dataSetString: [String] = []
    var condition = 0
    for char in dataSet {
        if char == "\""{
            condition = 1
        }
    }
    if condition == 1 {
        for i in 1...8 {
            dataSet.remove(at: dataSet.startIndex)
            if i<5{
                dataSet.remove(at: dataSet.index(before: dataSet.endIndex))
            }
        }
        
        dataSetString = dataSet.components(separatedBy: "\",\n    \"")
    }else{
        for i in 1...7 {
            dataSet.remove(at: dataSet.startIndex)
            if i<4{
                dataSet.remove(at: dataSet.index(before: dataSet.endIndex))
            }
        dataSetString = dataSet.components(separatedBy: ",\n    ")
        }
    }
    return dataSetString
}


