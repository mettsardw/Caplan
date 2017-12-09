//
//  TaskSprintSetView.swift
//  IndomitableProject
//
//  Created by yudi on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskSprintSetView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
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
        layer.isHidden = true
        for sprint in project.sprints {
            sprintData.append(sprint.name)
        }
    }
}
