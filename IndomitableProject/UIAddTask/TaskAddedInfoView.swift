//
//  TaskAddedInfoView.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskAddedInfoView: UIViewController {
    
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
    }
}
