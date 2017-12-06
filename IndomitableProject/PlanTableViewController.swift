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
    
    var sprintLabel: [String] = ["Sprint 1","Sprint 2","Sprint 3"] // append on making new sprint
    var customLabel: [String] = ["","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sprintLabel.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planTableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! PlanTableViewCell
        // Configure the cell...
//        let cellData = plans[indexPath.row]
        if indexPath.row == 0 {
            cell.upline.isHidden = true
        }
        if indexPath.row == (sprintLabel.count-1) {
            cell.downline.isHidden = true
            cell.days.isHidden = true
        }
        cell.name.text = "\(sprintLabel[indexPath.row])"
        cell.days.text = "\(arc4random_uniform(10))d"

        return cell
    }
    
    @IBAction func bubbleDidTap(){
        //display timeline
    }
    
    /*func manageProject() -> [Plan] {
        //initialize project, tasks.
        var plan: Plan = Plan(name: "Planning")
        //var plan2: Plan = Plan(name: "Sprinting")
//        plan.addTask(task: Task(name: "Design", memberCount: 1, time: Time(duration: 10, unit: .days)))
//        plan.addTask(task: Task(name: "Code", memberCount: 1, time: Time(duration: 5, unit: .days)))
//        plan.addTask(task: Task(name: "Testing", memberCount: 1, time: Time(duration: 7, unit: .days)))
//
        project.schedule.plans.append(plan)
        return project.schedule.plans
    }*/
}


