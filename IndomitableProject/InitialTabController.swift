//
//  InitialTabController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class InitialTabController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("first")
        
       // manageProject()
    }
}

//manage projects globally
var project: Project = Project()

func manageProject(){
    //initialize project, tasks.
    let plan: Plan = Plan(name: "Planning")
    //var plan2: Plan = Plan(name: "Sprinting")
    plan.addTask(task: Task(name: .Requirement, memberCount: 1, time: Time(duration: 10, unit: .days)))
    plan.addTask(task: Task(name: .Design, memberCount: 1, time: Time(duration: 5, unit: .days)))
    plan.addTask(task: Task(name: .Coding, memberCount: 1, time: Time(duration: 7, unit: .days)))

    project.schedule.plans.append(plan)
}

func taskToIndicateEndOfProject() -> Task{
    return Task(name: .Review, memberCount: 0, time: Time(duration: 0, unit: .days))
}

