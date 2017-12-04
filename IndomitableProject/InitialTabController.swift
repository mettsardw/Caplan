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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("first")
        
        //let newTask = NSManagedObject(entity: taskEntity!, insertInto: container)
        //let newEvent = NSManagedObject(entity: eventEntity!, insertInto: container)
        
        
      
    
        manageProject()

    }
}

//manage projects globally
var project: Project = Project()

func manageProject(){
    //initialize project, tasks.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let container = appDelegate.persistentContainer.viewContext
    
    let taskEntity = NSEntityDescription.entity(forEntityName: "TaskCore", in: container)
    let eventEntity = NSEntityDescription.entity(forEntityName: "EventCore", in: container)
    let timeEntity = NSEntityDescription.entity(forEntityName: "TimeCore", in: container)

    let newTime = TimeCore(entity: timeEntity!, insertInto: container)
    let newTime2 = TimeCore(entity: timeEntity!, insertInto: container)
    let newTask = TaskCore(entity: taskEntity!, insertInto: container)
    let newEvent = EventCore(entity: eventEntity!, insertInto: container)
    let newEvent1 = EventCore(entity: eventEntity!, insertInto: container)
    let newEvent2 = EventCore(entity: eventEntity!, insertInto: container)
    newTask.setValue("Testing", forKey: "name")
    newTask.setValue(10, forKey: "memberCount")
    newTask.setValue(50, forKey: "point")
    newTask.setValue(1, forKey: "priority")
    newTask.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
    newTime.setValue(15, forKey: "duration")
    newTime.setValue("days", forKey: "unit")
    newTask.time = newTime
    //print(newTask.time as Any)
    //        newTask.setValue("Design", forKey: "name")
    //        newTask.setValue("Coding", forKey: "name")
    //        newTask.setValue("Testing", forKey: "name")
    //        newTask.setValue("Requirement", forKey: "name")
    newEvent.setValue("Unit Testing", forKey: "type")
    newEvent1.setValue("Integration Testing", forKey: "type")
    newEvent2.setValue("System Testing", forKey: "type")
    //tipe data Int Masih bug kalo angkany sama.. wtf menn..
    newEvent.setValue(6, forKey: "memberCount")
    newEvent1.setValue(Int("9"), forKey: "memberCount")
    newEvent2.setValue(Int("7"), forKey: "memberCount")
    newTime2.setValue(5, forKey: "duration")
    newTime2.setValue("days", forKey: "unit")
    newEvent.time = newTime2
    newEvent1.time = newTime2
    newEvent2.time = newTime2


    newTask.addToEvent(newEvent)
    newTask.addToEvent(newEvent2)
    newTask.addToEvent(newEvent1)
//    saveData(targetContainer: container)

    
    let plan: Plan = Plan(name: "Planning")
    //var plan2: Plan = Plan(name: "Sprinting")
    //plan.addTask(task: Task(name: .Requirement, memberCount: 1, time: Time(duration: 10, unit: .days)))
    //plan.addTask(task: Task(name: .Design, memberCount: 1, time: Time(duration: 5, unit: .days)))
    //plan.addTask(task: Task(name: .Coding, memberCount: 1, time: Time(duration: 7, unit: .days)))
  
    let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
    do{
        let tasks: [TaskCore] = try container.fetch(taskFetch) as! [TaskCore]
        //var i=0
        for task in tasks {
//            print("name: \(task.value(forKey: "name") as! String)")
//            print("member Count: \(task.value(forKey: "memberCount")!)")
//            print("point: \(task.value(forKey: "point")!)")
//            guard let taskTimeUnit = task.time?.unit else{print("no unit");return}
//            print("time: \(String(describing: task.time!.duration)) \(taskTimeUnit)")
            
//            plan.addTask(task: Task(name: Tasks(rawValue: task.value(forKey: "name") as! String)!, memberCount: Int(task.memberCount), time: Time(duration: Int(task.time!.duration), unit: Unit(rawValue: task.time!.unit!)!)))
            //delete data di Core data
//            if i == 1{
//            deleteData(targetContainer: container, task: task)
//            }
//            i += 1
            //print("task value:\n\(String(describing: task.value(forKey: "event")!))")
            //get NSSet to String
//             guard let taskEvent = task.event?.value(forKeyPath: "time") else {print("no event");return}
//            task.event.
//            print(taskEvent)
//            let taskEventDataValue = getStringFromNSSet(data: taskEvent)
            //print(taskEventDataValue[0])
            //print(taskEventDataValue[1])
            //print(taskEventDataValue[2])
            //
            
        }
    }catch _ as NSError {
        print("error")
    }
    
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

func saveData(targetContainer: NSManagedObjectContext) {
    do {
        try targetContainer.save()
        print("save success")
    } catch _ as NSError {
        print("save error")
    }

}

func deleteData(targetContainer: NSManagedObjectContext, task: NSManagedObject) {
    targetContainer.delete(task)
    do {
        try targetContainer.save()
        print("delete success")
    } catch _ as NSError {
        print("save error")
    }

}
