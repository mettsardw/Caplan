//
//  TaskSprintSetView.swift
//  IndomitableProject
//
//  Created by yudi on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskSprintSetView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    @IBOutlet weak var teamSet: UITextField!
    @IBOutlet weak var durationSet: UITextField!
    
    var sourceTask: String?
    var timeData: [String] = ["Hour","Day","Month"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "successView" {
            let destination = segue.destination as! TaskAddedInfoView
            destination.sourceTask = self.sourceTask
        }
    }
    
    @IBAction func durationSetStepper(_ sender: UIStepper) {
        durationSet.text = String(format: "%.0f",sender.value)
    }
    @IBAction func teamSetStepper(_ sender: UIStepper) {
        teamSet.text = String(format: "%.0f",sender.value)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeData[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.dataSource = self
        timePicker.delegate = self
    }
}
