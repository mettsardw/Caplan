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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAnotherTask" {
            let destination = segue.destination as! TaskActivitesView
            if sourceTask == "Requirement" {
                destination.dataActivites.append("Requirement Ghatering")
                destination.dataActivites.append("Requirement Analysis")
            }else if sourceTask == "Design" {
                destination.dataActivites.append("System Design")
                destination.dataActivites.append("Program Design")
            }
            else if sourceTask == "Coding" {
                destination.dataActivites.append("Main")
                destination.dataActivites.append("Feature")
            }
            else if sourceTask == "Testing" {
                destination.dataActivites.append("Unit Testing")
                destination.dataActivites.append("Integration Testing")
                destination.dataActivites.append("System Testing")
            }
            else if sourceTask == "Review" {
                destination.dataActivites.append("Requirement fulfilled")
                destination.dataActivites.append("Performance")
                destination.dataActivites.append("Increment")
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
