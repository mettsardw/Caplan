//
//  TaskSprintSetView.swift
//  IndomitableProject
//
//  Created by yudi on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskSprintSetView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var alertSprintSet: UILabel!
    @IBOutlet weak var alertTeamSet: UILabel!
    @IBOutlet weak var layer: UIView!
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var selectSprint: UIButton!
    @IBOutlet weak var sprintPicker: UIPickerView!
    @IBOutlet weak var teamSet: UITextField!
    @IBAction func pickSprint(_ sender: UIButton) {
        layer.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.pickerContainer.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.pickerContainer.bounds.height - (self.tabBarController?.tabBar.frame.height)!, width: self.pickerContainer.bounds.width, height: self.pickerContainer.bounds.height)
        }
    }
    @IBAction func selectSprint(_ sender: UIButton) {
        layer.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.pickerContainer.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.pickerContainer.bounds.width, height: self.pickerContainer.bounds.height)
        }
        selectSprint.titleLabel?.text = sprintData[sprintPicker.selectedRow(inComponent: 0)]
    }
    
    var sourceTask: String?
    var sprintData: [String] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "successView" {
            let destination = segue.destination as! TaskAddedInfoView
            destination.sourceTask = self.sourceTask
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        
        if teamSet.text == "" || teamSet.text == "0" || selectSprint.titleLabel?.text == "Select a Sprint"{
            if teamSet.text == "" || teamSet.text == "0" {
                alertTeamSet.text = "set your team"
            }
            else{
                alertTeamSet.text = ""
            }
            if selectSprint.titleLabel?.text == "Select a Sprint"{
                alertSprintSet.text = "select a sprint"
            }else{
                alertSprintSet.text = ""
            }
        }else{
            performSegue(withIdentifier: "successView", sender: nil)
            alertTeamSet.text = ""
            alertSprintSet.text = ""
        }
    }
    
    @IBAction func teamSetStepper(_ sender: UIStepper) {
        teamSet.text = String(format: "%.0f",sender.value)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sprintData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sprintData[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sprintPicker.dataSource = self
        sprintPicker.delegate = self
        alertTeamSet.text = ""
        alertSprintSet.text = ""
        layer.isHidden = true
        for sprint in project.sprints {
            sprintData.append(sprint.name)
        }
    }
}
