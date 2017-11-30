//
//  TaskActivitiesView.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 29/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskActivitesView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var activitiesPicker: UIPickerView!
    var dataActivites: [String] = []
    var sourceTitle: String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataActivites.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataActivites[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiesPicker.dataSource = self
        activitiesPicker.delegate = self
        self.title = sourceTitle
    }
}
