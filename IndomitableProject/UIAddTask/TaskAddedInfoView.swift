//
//  TaskAddedInfoView.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class TaskAddedInfoView: UIViewController {
    var sourceSprintID: String?
    var sourceEvent: String?
    var sourceNotes: String?
    var sourceMemberCount: Int?
    var sourceTask: String?
    @IBAction func doneButton(){
        navigationController?.popToRootViewController(animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAnotherTask" {
            let destination = segue.destination as! TaskActivitesView
            if sourceTask == "Requirement" {
                destination.dataActivities.append("Requirement Ghatering")
                destination.dataActivities.append("Requirement Specification")
                destination.dataActivities.append("Requirement Validation")
            }else if sourceTask == "Design" {
                destination.dataActivities.append("System Design")
                destination.dataActivities.append("Program Design")
                destination.dataActivities.append("Database Design")
            }
            else if sourceTask == "Coding" {
                destination.dataActivities.append("Core System")
                destination.dataActivities.append("Additional Feature")
                destination.dataActivities.append("Database System")
            }
            else if sourceTask == "Testing" {
                destination.dataActivities.append("Unit Testing")
                destination.dataActivities.append("Integration Testing")
                destination.dataActivities.append("System Testing")
            }else{
                destination.dataActivities.append("yooman")
                destination.dataActivities.append("yooman")
                
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let container = getContainer()
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        do {
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as! [SprintCore]
            for sprint in projectSprints {
                let sprintID = String(describing: sprint.objectID)
                if sprintID == sourceSprintID {
                    sprint.addToTasks(setTask(name: sourceTask!, event: sourceEvent!, memberCount: sourceMemberCount!, notes: sourceNotes!))
                    saveData(targetContainer: container)
                    project = Project()
                }
            }
        } catch _ as NSError {
            print("error")
        }
    }
}
