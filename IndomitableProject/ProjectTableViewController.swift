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
    
    var projectName: String = "MyProject"
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
        
//        switch indexPath.row {
//        case 0:
//            performSegue(withIdentifier: "editNameSegue", sender: tableView.cellForRow(at: indexPath))
//        case 1:
//            performSegue(withIdentifier: "editTimeSegue", sender: tableView.cellForRow(at: indexPath))
//        case 2:
//            performSegue(withIdentifier: "resetSegue", sender: tableView.cellForRow(at: indexPath))
//        default:
//            print("error")
//        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenName = "projectCell\(indexPath.row)"
        let cell = projectTableView.dequeueReusableCell(withIdentifier: idenName, for: indexPath)
        cell.textLabel?.text = labels[indexPath.row]
        
        if indexPath.row == 2 {
            cell.textLabel?.font = cell.textLabel?.font.bold()
            cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0.3332303762, blue: 0.4212560356, alpha: 1)
        }
        
        return cell
    }
    
    @IBAction func showEditNameSegue(_ sender: UITableViewCell) {
        if sender.textLabel?.text == labels[0] {
            performSegue(withIdentifier: "editNameSegue", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNameSegue" {
            let destination = segue.destination as! EditNameViewController
            destination.descText = "edit project name..."
            destination.descLabel = projectLabel
        } else if segue.identifier == "editTimeSegue" {
            let destination = segue.destination as! EditTimeViewController
            destination.parentTimeLabel = daysLabel
        } else if segue.identifier == "resetSegue" {
            let destination = segue.destination as! ResetViewController
            destination.projectLabel = projectLabel
            destination.daysLabel = daysLabel
        }
    }
    
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
