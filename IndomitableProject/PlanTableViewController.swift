//
//  PlanTableViewController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class PlanTableViewController: UITableViewController {
    @IBOutlet weak var planTableView: UITableView!
    
    var sprintLabel: [String] = [] // append on making new sprint
    var customLabel: [String] = ["","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

            for sprint in project.sprints {
                sprintLabel.append(sprint.name)
            }
       
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
        cell.bubble.tag = indexPath.row
        cell.bubble.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.name.text = "\(sprintLabel[indexPath.row])"
        cell.days.text = "\(arc4random_uniform(10))d"

        return cell
    }
    
    func buttonAction(sender: UIButton!) {
        let btn: UIButton = sender
        let count: Int = sprintLabel.count
        for index in 0..<count {
            if btn.tag == index {
                //            guard let tlc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "newTimeline") as? TimelineController else {
                //                print("Could not instantiate timeline controller")
                //                return
                //            }
                var tlc: TimelineController = TimelineController(ofSprint: index)
                tlc.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                self.navigationController?.pushViewController(tlc, animated:true)
                //dismiss(animated: true, completion: nil)
            }
        }
//        if btn.tag == 0 {
////            guard let tlc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tlc") as? TimelineController else {
////                print("Could not instantiate timeline controller")
////                return
////            }
////            guard let tlc = UIStoryboard(name: "Plan", bundle: nil).instantiateViewController(withIdentifier: "newTimeline") as? TimelineController else {
////                print("Could not instantiate timeline controller")
////                return
////            }
//            var tlc: TimelineController = TimelineController(ofSprint: 0)
//            tlc.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//            self.navigationController?.pushViewController(tlc, animated:true)
//            //dismiss(animated: true, completion: nil)
//        }
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


