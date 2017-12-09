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
//        let newProject = NSEntityDescription.insertNewObject(forEntityName: "ProjectCore", into: container) as! ProjectCore
//        let newUser =  NSEntityDescription.insertNewObject(forEntityName: "UserCore", into: container) as! UserCore
//
//        let newTask = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//        let newTask2 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//        let newTask3 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
//        let newTask4 = NSEntityDescription.insertNewObject(forEntityName: "TaskCore", into: container) as! TaskCore
    
//        let newEvent = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
//        let newEvent1 = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
    //    let newEvent2 = NSEntityDescription.insertNewObject(forEntityName: "EventCore", into: container) as! EventCore
//
//
//            newProject.setValue("MyProject", forKey: "name")
//            newProject.setValue(30, forKey: "duration")
//            newProject.setValue("days", forKey: "durationUnit")
//
//    //////---- USER ----//
//            newUser.setValue("Sardew", forKey: "name")
//            newUser.setValue("mettasaridewi.w@gmail.com", forKey: "account")
//            newUser.project = newProject
//
//    ////////---- PROJECT ----//
//        newProject.userCore = newUser
//    //
//    //////---- SPRINT ----//
//          newSprint.setValue("Sprint 2", forKey: "name")
//          newSprint.setValue(20, forKey: "duration")
//          newSprint.setValue("days", forKey: "durationUnit")
//////
//    ///// ---- TASK ----//
//        newTask.setValue("Requirement", forKey: "name")
//        newTask.setValue(1, forKey: "priority")
//////
////
    //---------------------------------------------//
//        newTask2.setValue("Design", forKey: "name")
//        newTask2.setValue(50, forKey: "point")
//        newTask2.setValue(1, forKey: "priority")
//
    
    //---------------------------------------------//
//        newTask3.setValue("Coding", forKey: "name")
//        newTask3.setValue(10, forKey: "memberCount")
//        newTask3.setValue(80, forKey: "point")
//        newTask3.setValue(1, forKey: "priority")
//        newTask3.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
//        newTask3.setValue(7, forKey: "duration")
//        newTask3.setValue("days", forKey: "durationUnit")

//    //---------------------------------------------//
//        newTask4.setValue("Testing", forKey: "name")
//        newTask4.setValue(10, forKey: "memberCount")
//        newTask4.setValue(40, forKey: "point")
//        newTask4.setValue(1, forKey: "priority")
//        newTask4.setValue("ini Design: lorem ipsum dolor sit amet", forKey: "notes")
//        newTask4.setValue(7, forKey: "duration")
//        newTask4.setValue("days", forKey: "durationUnit")
//
//    //--------------------------------------------//
//
//
    //set Event
//        newEvent.setValue("Requirement Gathering", forKey: "type")
//        newEvent.setValue(3, forKey: "memberCount")
//        newEvent.setValue(2, forKey: "duration")
//        newEvent.setValue("days", forKey: "durationUnit")
//        newEvent.setValue("ini req gather", forKey: "notes")
//        newEvent.setValue(5, forKey: "point")
//
//        newEvent1.setValue("Requirement Specification", forKey: "type")
//        newEvent1.setValue(7, forKey: "memberCount")
//        newEvent1.setValue(1, forKey: "duration")
//        newEvent1.setValue("days", forKey: "durationUnit")
//        newEvent1.setValue("ini req spec", forKey: "notes")
//        newEvent1.setValue(5, forKey: "point")
//
//
//
//        newEvent2.setValue("Database Design", forKey: "type")
//        newEvent2.setValue(2, forKey: "memberCount")
//        newEvent2.setValue(4, forKey: "duration")
//        newEvent2.setValue("days", forKey: "durationUnit")//

//        newTask.addToEvent(newEvent)
//        newTask.addToEvent(newEvent2)
//        newTask.addToEvent(newEvent1)
//        newTask2.addToEvent(newEvent2)
//        newProject.addToSprintCore(newSprint)
//        newSprint.addToTasks(newTask)
    
    
//        newEvent1.setValue("Alpha Testing", forKey: "type")
//        newEvent1.setValue(5, forKey: "memberCount")
//        newEvent1.setValue(1, forKey: "duration")
//        newEvent1.setValue("days", forKey: "durationUnit")
    
//
//        newEvent2.setValue("Design UX", forKey: "type")
//        newEvent2.setValue(2, forKey: "memberCount")
//        newEvent2.setValue(4, forKey: "duration")
//        newEvent2.setValue("days", forKey: "durationUnit")
//
//        newTask.addToEvent(newEvent)
//        newTask.addToEvent(newEvent1)
    //    newTask.addToEvent(newEvent1)
   //     newTask2.addToEvent(newEvent2)
//        newProject.addToSprintCore(newSprint)
    //    newSprint.addToTasks(newTask)
    //
    
//        newProject.addToSprintCore(newSprint)
//        newSprint.addToTasks(newTask3)
//        newSprint.addToTasks(newTask4)
//
    
    
//        saveData(targetContainer: container)
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
//        saveData(targetContainer: container)
        for project in projects{
            print("name \(String(describing: project.name))")
        }
//        saveData(targetContainer: container)
        
        ////////////////////////////////////// SPRINT PROJECT ///////////////////////////////////////////
        let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as![SprintCore]
//        projectSprints[0].addToTasks(newTask)
//        saveData(targetContainer: container)
        let sprints: [SprintCore] = try container.fetch(sprintFecth) as! [SprintCore]
        print("Sprint: \(sprints.count)")
        for sprint in projectSprints {
            print("name \(String(describing: sprint.name)) ")
        }

        
        //////////////////////////////////////// TASK SPRINT /////////////////////////////////////////////
        let sprintTasks: [TaskCore] = projectSprints[1].tasks?.allObjects as! [TaskCore]
        let tasks: [TaskCore] = try container.fetch(taskFetch) as! [TaskCore]
        
//        sprintTasks[1].addToEvent(newEvent2)
//        saveData(targetContainer: container)
        print("\nTasks : \(tasks.count)")
       // deleteData(targetContainer: container, object: tasks[1])
        
        
        
        for task in tasks {
            print("name: \(String(describing: task.name))")
            sprint.addTask(task: Task(name: Tasks(rawValue: task.name!)!))
            //deleteData(targetContainer: container, object: task)
        }
//        sprintTasks[0].addToEvent(newEvent)
//        sprintTasks[0].addToEvent(newEvent1)
//        saveData(targetContainer: container)
        //////////////////////////////////////// EVENT TASK /////////////////////////////////////////////
        let taskEvents: [EventCore] = sprintTasks[0].event?.allObjects as! [EventCore]
        let events: [EventCore] = try container.fetch(eventFetch) as! [EventCore]
        
        print("Event : \(events.count)")
        for event in taskEvents {
            print("name: \(String(describing: event.type))")
            //deleteData(targetContainer: container, object: event)
        }
        
    }catch _ as NSError {
        print("error")
    }
    
    project.sprints.append(sprint)
}

func taskToIndicateEndOfProject() -> Event{
    return Event(timeBoxed: Time(duration: 1, unit: Unit.days), type: "Review", memberCount: 2, notes: "review works", point: 5)
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
    
    var totalDuration = 0
    for sprint in project.sprints {
        for task in sprint.tasks{
            for event in task.events{
                totalDuration += event.timeBoxed.duration
            }
        }
    }
    return totalDuration
}

func getContainer() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let container = appDelegate.persistentContainer.viewContext
    return container
}
