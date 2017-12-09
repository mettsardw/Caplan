//
//  TaskPickerView.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskPickerView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func showActDetail(_ sender: UIButton) {

            performSegue(withIdentifier: "taskDetail", sender: nil)
    }
    @IBOutlet weak var dataPicker: UIPickerView!
    var taskData: [String] = ["Requirement","Design","Coding","Testing"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return taskData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return taskData[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskDetail"{
            
            let destination = segue.destination as! TaskActivitesView
            let selectedData: String = taskData[dataPicker.selectedRow(inComponent: 0)]
            
            destination.sourceTask = selectedData
            if selectedData == "Requirement" {
                destination.dataActivities.append("Requirement Ghatering")
                destination.dataActivities.append("Requirement Specification")
                destination.dataActivities.append("Requirement Validation")
                destination.descriptionActivities.append("Gathering information for the Idea. These ideas can come from market research including the demographics of potential new customers, existing customers, sales prospects who rejected the product, other internal software development staff, or a creative third party. Ideas for software products are usually first evaluated by marketing personnel for economic feasibility, for fit with existing channels distribution, for possible effects on existing product lines, required features, and for fit with the company's marketing objectives.")
                destination.descriptionActivities.append("It’s the activity of writing down the information gathered during the elicitation and analysis activity into a document that defines a set of requirements. Two types of requirements may be included in this document; user and system requirements.")
                destination.descriptionActivities.append("It’s the process of checking the requirements for realism, consistency and completeness. During this process, our goal is to discover errors in the requirements document. When errors are found, it must be modified to correct these problems.")
            }else if selectedData == "Design" { 
                destination.dataActivities.append("System Design")
                destination.dataActivities.append("Software Design")
                destination.dataActivities.append("Database Design")
                destination.descriptionActivities.append("Systems design is the process of defining the architecture, modules, interfaces, and data for a system to satisfy specified requirements. Systems design could be seen as the application of systems theory to product development.")
                destination.descriptionActivities.append("all the activity involved in conceptualizing, framing, implementing, commissioning, and ultimately modifying complex systems or the activity following requirements specification and before programming, as ... [in] a stylized software engineering process.")
                destination.descriptionActivities.append("Database design is the process of producing a detailed data model of a database. This data model contains all the needed logical and physical design choices and physical storage parameters needed to generate a design in a data definition language, which can then be used to create a database. A fully attributed data model contains detailed attributes for each entity.")
            }
            else if selectedData == "Coding" {
                destination.dataActivities.append("Core System")
                destination.dataActivities.append("Additional Feature")
                destination.dataActivities.append("Database System")
                destination.descriptionActivities.append("Coding a core of an application that determine what is the main functionality of the application")
                destination.descriptionActivities.append("Coding the other feature needed in application. This is an optional task if your application have some other features to be added.")
                destination.descriptionActivities.append("Coding the database system using specific Database Management System (DBMS).")
            }
            else if selectedData == "Testing" {
                destination.dataActivities.append("Unit Testing")
                destination.dataActivities.append("Integration Testing")
                destination.dataActivities.append("System Testing")
                destination.descriptionActivities.append("Unit testing refers to tests that verify the functionality of a specific section of code, usually at the function level. In an object-oriented environment, this is usually at the class level, and the minimal unit tests include the constructors and destructors.")
                destination.descriptionActivities.append("Integration testing is any type of software testing that seeks to verify the interfaces between components against a software design. Software components may be integrated in an iterative way or all together (\"big bang\"). Normally the former is considered a better practice since it allows interface issues to be located more quickly and fixed.")
                destination.descriptionActivities.append("System testing tests a completely integrated system to verify that the system meets its requirements.")
            }else{
                destination.dataActivities.append("yooman")
                destination.dataActivities.append("yooman")

            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataPicker.dataSource = self
        dataPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
