//
//  PlanTableViewController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class PlanTableViewController: UITableViewController {
    @IBOutlet weak var planTableView: UITableView!
    var plans: [Plan]! //get plans from project
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // plans = manageProject()
        
        print(plans.count)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("b")
        return plans.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("c")
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planTableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! PlanTableViewCell
        print("a")
        // Configure the cell...
        let cellData = plans[indexPath.row]
        
        cell.name.text = cellData.name
        cell.days.text = "\(cellData.duration)d"
        
        return cell
    }
    
    /*func manageProject() -> [Plan] {
        //initialize project, tasks.
        var plan: Plan = Plan(name: "Planning")
        //var plan2: Plan = Plan(name: "Sprinting")
        plan.addTask(task: Task(name: "Design", memberCount: 1, time: Time(duration: 10, unit: .days)))
        plan.addTask(task: Task(name: "Code", memberCount: 1, time: Time(duration: 5, unit: .days)))
        plan.addTask(task: Task(name: "Testing", memberCount: 1, time: Time(duration: 7, unit: .days)))
        
        project.schedule.plans.append(plan)
        return project.schedule.plans
    }*/
}


