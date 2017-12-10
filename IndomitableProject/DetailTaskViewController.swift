//
//  DetailTaskViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/8/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class DetailTaskViewController: UIViewController {
    
    @IBOutlet weak var dayLeftLabel: UILabel?
    @IBOutlet weak var taskNameLabel: UILabel?
    @IBOutlet weak var peopleWorkingLabel: UILabel?
    @IBOutlet weak var notesLabel: UILabel?
    @IBOutlet weak var deadlineLabel: UILabel?
    
    @IBOutlet weak var deleteBtn: UIButton!
    var taskName: String?
    var dayLeftText: String?
    var peopleWorkingText: String?
    var notesText: String?
    var sourceObjectID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteBtn.layer.cornerRadius = 10
        self.title = "Detail Task"
        self.navigationItem.backBarButtonItem?.title = " "
        taskNameLabel?.text = taskName
        dayLeftLabel?.text = "\(dayLeftText!) days left"
        peopleWorkingLabel?.text = "\(peopleWorkingText!) Person(s)"
        notesLabel?.text = notesText
        var date = Date()
        let calendar = Calendar.current
        date = calendar.date(byAdding: .day, value: Int(dayLeftText!)!, to: date)!
        
        deadlineLabel?.text = "\(calendar.component(.day, from: date)) - \(calendar.component(.month, from: date)) - \(calendar.component(.year, from: date))"
    }
    
    @IBAction func deleteDidTap(_ sender: UIButton) {
        let container = getContainer()
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        do{
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as! [SprintCore]
            for sprint in projectSprints {
                let sprintTasks: [TaskCore] = sprint.tasks?.allObjects as! [TaskCore]
                for task in sprintTasks {
                    let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
                    for event in taskEvents {
                        let objectID = String(describing: event.objectID)
                        if objectID == sourceObjectID {
                            task.removeFromEvent(event)
                            saveData(targetContainer: container)
                        }
                    }
                }
            }
            project = Project()
        }catch _ as NSError{
            print("error")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func seeTipsDidTap() {
        
    }
    
    @IBAction func changeTask() {
        performSegue(withIdentifier: "editTaskSegue", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTaskSegue" {
            let destination = segue.destination as! EditTaskViewController
            destination.notesText = notesText!
            destination.peopleText = peopleWorkingText!
            destination.taskText = taskName!
            destination.sourceObjectID = sourceObjectID
            let container = getContainer()
            let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
            do{
                let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
                let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as! [SprintCore]
                for sprint in projectSprints {
                    let sprintTasks: [TaskCore] = sprint.tasks?.allObjects as! [TaskCore]
                    for task in sprintTasks {
                        let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
                        for event in taskEvents {
                            let objectID = String(describing: event.objectID)
                            if objectID == sourceObjectID {
                                let getTask = event.taskEvent?.name!
                                if getTask == "Requirement" {
                                    destination.data.append("Requirement Ghatering")
                                    destination.data.append("Requirement Specification")
                                    destination.data.append("Requirement Validation")
                                }else if getTask == "Design" {
                                    destination.data.append("System Design")
                                    destination.data.append("Program Design")
                                    destination.data.append("Database Design")
                                }
                                else if getTask == "Coding" {
                                    destination.data.append("Core System")
                                    destination.data.append("Additional Feature")
                                    destination.data.append("Database System")
                                }
                                else if getTask == "Testing" {
                                    destination.data.append("Unit Testing")
                                    destination.data.append("Integration Testing")
                                    destination.data.append("System Testing")
                                }else{
                                    destination.data.append("yooman")
                                    destination.data.append("yooman")
                                    
                                }
                            }
                        }
                    }
                }
            }catch _ as NSError{
                print("error")
            }
        }
    }
    
}
