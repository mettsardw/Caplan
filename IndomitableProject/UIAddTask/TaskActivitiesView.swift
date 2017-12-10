//
//  TaskActivitiesView.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 29/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskActivitesView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var activitiesPicker: UIPickerView!
    var dataActivities: [String] = []
    var descriptionActivities: [String] = []
    var sourceTask: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sprintSetup" {
            let destination = segue.destination as! TaskSprintSetView
            destination.sourceTask = sourceTask
            destination.sourceActivities = dataActivities[activitiesPicker.selectedRow(inComponent: 0)]
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataActivities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataActivities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        descriptionText.text = descriptionActivities[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiesPicker.dataSource = self
        activitiesPicker.delegate = self
        self.title = sourceTask
        descriptionText.text = descriptionActivities[0]
        
        
    }
}
