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
                destination.dataActivites.append("Requirement Ghatering")
                destination.dataActivites.append("Requirement Specification")
                destination.dataActivites.append("Requirement Validation")
            }else if sourceTask == "Design" {
                destination.dataActivites.append("System Design")
                destination.dataActivites.append("Program Design")
                destination.dataActivites.append("Database Design")
            }
            else if sourceTask == "Coding" {
                destination.dataActivites.append("Core System")
                destination.dataActivites.append("Additional Feature")
                destination.dataActivites.append("Database System")
            }
            else if sourceTask == "Testing" {
                destination.dataActivites.append("Unit Testing")
                destination.dataActivites.append("Integration Testing")
                destination.dataActivites.append("System Testing")
            }else{
                destination.dataActivites.append("yooman")
                destination.dataActivites.append("yooman")
                
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
