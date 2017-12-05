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
    

//    let newTask = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//    let newTask2 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//    let newTask3 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//    let newTask4 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//    let newProject = NSEntityDescription.insertNewObject(forEntityName: "ProjectCore", into: container) as! ProjectCore
//    let newUser =  NSEntityDescription.insertNewObject(forEntityName: "UserCore", into: container) as! UserCore
//    let newEvent = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
//    let newEvent1 = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
//    let newEvent2 = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
    
// ---> //set data Task
//    newProject.setValue("MyProject", forKey: "name")
    //--- USER ---//
//    newUser.setValue("Sardew", forKey: "name")
//    newUser.setValue("mettasaridewi.w@gmail.com", forKey: "account")
//    newUser.project = newProject
    //--- PROJECT ---//
//    newProject.userCore = newUser
    // --- TASK ---//
//    newTask.setValue("Requirement", forKey: "name")
//    newTask.setValue(10, forKey: "memberCount")
//    newTask.setValue(30, forKey: "point")
//    newTask.setValue(1, forKey: "priority")
//    newTask.setValue("ini: lorem ipsum dolor sit amet", forKey: "notes")
//    newTask.setValue(5, forKey: "duration")
//    newTask.setValue("days", forKey: "durationUnit")

//
////---------------------------------------------//
//    newTask2.setValue("Design", forKey: "name")
//    newTask2.setValue(10, forKey: "memberCount")
//    newTask2.setValue(50, forKey: "point")
//    newTask2.setValue(1, forKey: "priority")
//    newTask2.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
//    newTask2.setValue(7, forKey: "duration")
//    newTask2.setValue("days", forKey: "durationUnit")

//
////---------------------------------------------//
//    newTask3.setValue("Coding", forKey: "name")
//    newTask3.setValue(10, forKey: "memberCount")
//    newTask3.setValue(80, forKey: "point")
//    newTask3.setValue(1, forKey: "priority")
//    newTask3.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
//    newTask3.setValue(7, forKey: "duration")
//    newTask3.setValue("days", forKey: "durationUnit")
//
////---------------------------------------------//
//    newTask4.setValue("Testing", forKey: "name")
//    newTask4.setValue(10, forKey: "memberCount")
//    newTask4.setValue(40, forKey: "point")
//    newTask4.setValue(1, forKey: "priority")
//    newTask4.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
//    newTask4.setValue(7, forKey: "duration")
//    newTask4.setValue("days", forKey: "durationUnit")

//--------------------------------------------//

    //print(newProject)
   // print("User :")
   // print(newUser)
    
//    //set Event
//    newEvent.setValue("Beta Testing", forKey: "type")
//    newEvent1.setValue("Alpha Testing", forKey: "type")
//    newEvent2.setValue("Design UX", forKey: "type")
//
//    newEvent.setValue(2, forKey: "duration")
//    newEvent1.setValue(1, forKey: "duration")
//    newEvent2.setValue(4, forKey: "duration")
//
//    newEvent.setValue("days", forKey: "durationUnit")
//    newEvent1.setValue("days", forKey: "durationUnit")
//    newEvent2.setValue("days", forKey: "durationUnit")
//
//    newEvent.setValue(3, forKey: "memberCount")
//    newEvent1.setValue(5, forKey: "memberCount")
//    newEvent2.setValue(2, forKey: "memberCount")
//
//    newTask.addToEvent(newEvent)
//    newTask.addToEvent(newEvent2)
//    newTask.addToEvent(newEvent1)
//
//
  //saveData(targetContainer: container)

    
    let plan: Plan = Plan(name: "Planning")
    //var plan2: Plan = Plan(name: "Sprinting")
    let userFetch = NSFetchRequest<NSManagedObject>(entityName: "UserCore")
    let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
    let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
    do{
        let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            print("Project : \(projects.count)")
//              projects[0].addToTaskCore(newTask)
//              projects[0].addToTaskCore(newTask2)
//              projects[0].addToTaskCore(newTask3)
//              projects[0].addToTaskCore(newTask4)
        //saveData(targetContainer: container)
        for project in projects{
            print("name \(String(describing: project.name))")
        }
        //let tasks: [TaskCore] = projects[0].taskCore?.allObjects as! [TaskCore]
        let users: [UserCore] = try container.fetch(userFetch) as! [UserCore]
        print("\nUsers : \(users.count)")
        for user in users {
            print("name \(String(describing: user.name))")
        }
   
        let projectTask: [TaskCore] = projects[0].taskCore?.allObjects as! [TaskCore]
        //var i=0
        let tasks: [TaskCore] = try container.fetch(taskFetch) as! [TaskCore]
        print("\nTasks : \(tasks.count)")
   
        //print(projectTask)
        for task in projectTask {
            print("name: \(String(describing: task.name))")
//            print("member Count: \(task.value(forKey: "memberCount")!)")
//            print("point: \(task.value(forKey: "point")!)")
//            print(task)
            plan.addTask(task: Task(name: Tasks(rawValue: task.value(forKey: "name") as! String)!, memberCount: Int(task.memberCount), time: Time(duration: Int(task.duration), unit: Unit(rawValue: task.durationUnit!)!)))
            //delete data di Core data
//            if i == 1{
              //deleteData(targetContainer: container, object: task)
//            }
//            i += 1
            //print("task value:\n\(String(describing: task.value(forKey: "event")!))")
            //get NSSet to String
            //guard let taskEvent = task.event?.value(forKey: "duration") else{print("error");return}
            //print(taskEvent)
            //let taskEventDataValue = getStringFromNSSet(data: taskEvent)

            
            //access member of NSset in NsManagedObject
            //let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
            
//            print(taskEvents[0].time!.duration as Any)
//            print(taskEvents[0].duration)
//            print(taskEvents[1].duration)
//            print(taskEvents[2].duration)
            
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

func saveData(targetContainer: NSManagedObjectContext) {
    do {
        try targetContainer.save()
        print("save success")
    } catch _ as NSError {
        print("save error")
    }

}

func deleteData(targetContainer: NSManagedObjectContext, object: NSManagedObject) {
    targetContainer.delete(object)
    do {
        try targetContainer.save()
        print("delete success")
    } catch _ as NSError {
        print("save error")
    }

}

func getTotalDuration() -> Int {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let container = appDelegate.persistentContainer.viewContext
    let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
    var totalDuration = 0
    do{
        
        let tasks: [TaskCore] = try container.fetch(taskFetch) as! [TaskCore]
        for task in tasks {
            totalDuration += Int(task.duration)
        }
        
    }catch _ as NSError {
        print("error")
    }
    return totalDuration
}
