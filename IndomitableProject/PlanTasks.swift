//
//  SprintPlanning.swift
//  IndomitableProject
//
//  Created by Martinus on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct PlanTasks{
    
    var day: String
    var desc: String
    
    static func fetchData() -> [PlanTasks]{
        var planTasks: [PlanTasks] = []
        
        planTasks.append(PlanTasks(day: "7", desc: "This is the first task"))
        planTasks.append(PlanTasks(day: "8", desc: "That is the second task"))
        planTasks.append(PlanTasks(day: "9", desc: "This is the third task"))
        
        
        //let plan: Plan = Plan(name: "Planning")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
        do{
            let tasks: [TaskCore] = try container.fetch(taskFetch) as! [TaskCore]
            //var i=0
            for task in tasks {
                let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
                
                
                //print(task)
                
                //            print("name: \(task.value(forKey: "name") as! String)")
                //            print("member Count: \(task.value(forKey: "memberCount")!)")
                //            print("point: \(task.value(forKey: "point")!)")
                //            guard let taskTimeUnit = task.time?.unit else{print("no unit");return}
                //            print("time: \(String(describing: task.time!.duration)) \(taskTimeUnit)")
                
//                plan.addTask(task: Task(name: Tasks(rawValue: task.value(forKey: "name") as! String)!, memberCount: Int(task.memberCount), time: Time(duration: Int(task.time!.duration), unit: Unit(rawValue: task.time!.unit!)!)))
                //delete data di Core data
                //            if i == 1{
                //            deleteData(targetContainer: container, task: task)
                //            }
                //            i += 1
                //print("task value:\n\(String(describing: task.value(forKey: "event")!))")
                //get NSSet to String
//                 guard let taskEvent = task.event?.value(forKeyPath: "memberCount") else {print("no event")}
//                                print(taskEvent)
//                
//                let taskEventDataValue = getStringFromNSSet(data: taskEvent)
                
                //print(taskEventDataValue[0])
                //print(taskEventDataValue[1])
                //print(taskEventDataValue[2])
                //
                
            }
        }catch _ as NSError {
            print("error")
        }

        
        
        return planTasks
    }
}



