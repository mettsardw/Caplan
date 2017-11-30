//
//  ProjectTableViewController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class ProjectTableViewControlelr: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var projectTableView: UITableView!
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    
    var projectName: String = "My Project"
    var projectDays: Int = 100
    var projectIcon: UIImage?
    var labels: [String] = ["edit project name","edit time limit","reset"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize view
        projectLabel.text = projectName
        daysLabel.text = "\(projectDays) days left"
        
        //initialize image view
        projectImage.layer.masksToBounds = false
        projectImage.layer.cornerRadius = projectImage.frame.height/2
        projectImage.clipsToBounds = true
        
        projectTableView.dataSource = self
        projectTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 0) {
            
        }
        else if (indexPath.row == 0) {
            //do something else
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectTableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)
        cell.textLabel?.text = labels[indexPath.row]
        
        if indexPath.row == 2 {
            cell.textLabel?.font = cell.textLabel?.font.bold()
            cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0.3332303762, blue: 0.4212560356, alpha: 1)
        }
        
        return cell
    }
    
    //    func manageProject() -> [Plan] {
    //        //initialize project, tasks.
    //        var plan: Plan = Plan(name: "Planning")
    //        //var plan2: Plan = Plan(name: "Sprinting")
    //        plan.addTask(task: Task(name: "Design", memberCount: 1, time: Time(duration: 10, unit: .days)))
    //        plan.addTask(task: Task(name: "Code", memberCount: 1, time: Time(duration: 5, unit: .days)))
    //        plan.addTask(task: Task(name: "Testing", memberCount: 1, time: Time(duration: 7, unit: .days)))
    //
    //        project.schedule.plans.append(plan)
    //        return project.schedule.plans
    //    }
    
    
}

extension UIFont {
    
    func withTraits(traits:UIFontDescriptorSymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
