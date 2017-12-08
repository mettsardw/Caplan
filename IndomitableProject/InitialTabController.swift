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
    let notification = Notification()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("first")
        manageProject()
        
        //notification
        notification.viewDidLoad()
        
        print("first")
    }
    
}

//manage projects globally
var project: Project = Project()

func manageProject(){
    //initialize project, tasks.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let container = appDelegate.persistentContainer.viewContext
///////////////////   BARU ///////////////////////////////////////
//        let newSprint = NSEntityDescription.insertNewObject(forEntityName: "SprintCore", into: container) as! SprintCore
    //    let newProject = NSEntityDescription.insertNewObject(forEntityName: "ProjectCore", into: container) as! ProjectCore
    //    let newUser =  NSEntityDescription.insertNewObject(forEntityName: "UserCore", into: container) as! UserCore
    
//        let newTask = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
    //    let newTask2 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
    //    let newTask3 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
    //    let newTask4 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
    
//        let newEvent = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
    //    let newEvent1 = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
    //    let newEvent2 = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
    //
    
    //        newProject.setValue("MyProject", forKey: "name")
    //        newProject.setValue(30, forKey: "duration")
    //        newProject.setValue("days", forKey: "durationUnit")
    
    ////////---- USER ----//
//            newUser.setValue("Sardew", forKey: "name")
//            newUser.setValue("mettasaridewi.w@gmail.com", forKey: "account")
//            newUser.project = newProject
    
    ////////---- PROJECT ----//
    //    newProject.userCore = newUser
    ////
    ////////---- SPRINT ----//
//          newSprint.setValue("Sprint 1", forKey: "name")
//          newSprint.setValue(20, forKey: "duration")
//          newSprint.setValue("days", forKey: "durationUnit")
    
    /////// ---- TASK ----//
//        newTask.setValue("Requirement", forKey: "name")
//        newTask.setValue(10, forKey: "memberCount")
//        newTask.setValue(30, forKey: "point")
//        newTask.setValue(1, forKey: "priority")
//        newTask.setValue("ini: lorem ipsum dolor sit amet", forKey: "notes")
//        newTask.setValue(5, forKey: "duration")
//        newTask.setValue("days", forKey: "durationUnit")
//
    
    //---------------------------------------------//
     //   newTask2.setValue("Design", forKey: "name")
     //   newTask2.setValue(10, forKey: "memberCount")
     //   newTask2.setValue(50, forKey: "point")
     //   newTask2.setValue(1, forKey: "priority")
    //    newTask2.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
    //    newTask2.setValue(7, forKey: "duration")
    //    newTask2.setValue("days", forKey: "durationUnit")
    
    
    //---------------------------------------------//
    //    newTask3.setValue("Coding", forKey: "name")
    //    newTask3.setValue(10, forKey: "memberCount")
    //    newTask3.setValue(80, forKey: "point")
    //    newTask3.setValue(1, forKey: "priority")
    //    newTask3.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
    //    newTask3.setValue(7, forKey: "duration")
    //    newTask3.setValue("days", forKey: "durationUnit")
    
    //---------------------------------------------//
    //    newTask4.setValue("Testing", forKey: "name")
    //    newTask4.setValue(10, forKey: "memberCount")
    //    newTask4.setValue(40, forKey: "point")
    //    newTask4.setValue(1, forKey: "priority")
    //    newTask4.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
    //    newTask4.setValue(7, forKey: "duration")
    //    newTask4.setValue("days", forKey: "durationUnit")
    
    //--------------------------------------------//
    
    
    //set Event
//        newEvent.setValue("Beta Testing", forKey: "type")
//        newEvent.setValue(3, forKey: "memberCount")
//        newEvent.setValue(2, forKey: "duration")
//        newEvent.setValue("days", forKey: "durationUnit")
    
    
    //    newEvent1.setValue("Alpha Testing", forKey: "type")
    //    newEvent1.setValue(5, forKey: "memberCount")
    //    newEvent1.setValue(1, forKey: "duration")
    //    newEvent1.setValue("days", forKey: "durationUnit")
    
    
    //    newEvent2.setValue("Design UX", forKey: "type")
    //    newEvent2.setValue(2, forKey: "memberCount")
    //    newEvent2.setValue(4, forKey: "duration")
    //    newEvent2.setValue("days", forKey: "durationUnit")//
    
    //    newTask.addToEvent(newEvent)
    //    newTask.addToEvent(newEvent2)
    //    newTask.addToEvent(newEvent1)
   //     newTask2.addToEvent(newEvent2)
//        newProject.addToSprintCore(newSprint)
    //    newSprint.addToTasks(newTask)
    //
    
    
    //    saveData(targetContainer: container)
    let sprint: Sprint = Sprint(name: "Planning")
    //var plan2: Plan = Plan(name: "Sprinting")
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////  FECTH DATA   &   DEBUGGING PRINT  ////////////////////////////////////
    
    let sprintFecth = NSFetchRequest<NSManagedObject>(entityName: "SprintCore")
    let userFetch = NSFetchRequest<NSManagedObject>(entityName: "UserCore")
    let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
    let taskFetch = NSFetchRequest<NSManagedObject>(entityName: "TaskCore")
    let eventFetch = NSFetchRequest<NSManagedObject>(entityName: "EventCore")
    do{
        //////////////////////////////////////USER////////////////////////////////////////////////////
        let users: [UserCore] = try container.fetch(userFetch) as! [UserCore]
        //deleteData(targetContainer: container, object: users[0])
        print("\nUsers : \(users.count)")
        for user in users {
            print("name \(String(describing: user.name))")
        }
        
        /////////////////////////////////////// PROJECT USER ////////////////////////////////////////////
        let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
        //deleteData(targetContainer: container, object: projects[0])
        print("Project : \(projects.count)")
//        projects[0].addToSprintCore(newSprint)
        for project in projects{
            print("name \(String(describing: project.name))")
        }
//        saveData(targetContainer: container)
        
        ////////////////////////////////////// SPRINT PROJECT ///////////////////////////////////////////
        let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as![SprintCore]
        //        projectSprints[0].addToTasks(newTask2)
        let sprints: [SprintCore] = try container.fetch(sprintFecth) as! [SprintCore]
        print("Sprint: \(sprints.count)")
        for sprint in sprints {
            print("name \(String(describing: sprint.name)) ")
        }
//        saveData(targetContainer: container)
        
        //////////////////////////////////////// TASK SPRINT /////////////////////////////////////////////
        let sprintTasks: [TaskCore] = projectSprints[0].tasks?.allObjects as! [TaskCore]
        let tasks: [TaskCore] = try container.fetch(taskFetch) as! [TaskCore]
        
        //sprintTasks[0].addToEvent(newEvent2)
        //saveData(targetContainer: container)
        print("\nTasks : \(tasks.count)")
        
        for task in sprintTasks {
            print("name: \(String(describing: task.name))")
            sprint.addTask(task: Task(name: Tasks(rawValue: task.value(forKey: "name") as! String)!, memberCount: Int(task.memberCount), time: Time(duration: Int(task.duration), unit: Unit(rawValue: task.durationUnit!)!)))
        }
        
        //////////////////////////////////////// EVENT TASK /////////////////////////////////////////////
        let taskEvents: [EventCore] = sprintTasks[1].event?.allObjects as! [EventCore]
        //let events: [EventCore] = try container.fetch(eventFetch) as! [EventCore]
        
        print("Event : \(taskEvents.count)")
        for event in taskEvents {
            print("name: \(String(describing: event.type))")
        }
        
    }catch _ as NSError {
        print("error")
    }
    
    project.sprints.append(sprint)
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
