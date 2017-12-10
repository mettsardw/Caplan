//
//  EditTaskViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/10/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var layer: UIView!
    @IBOutlet weak var taskNameField: UILabel!
    @IBOutlet weak var personWorkingField: UITextField!
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var pickerTime: UIView!
    @IBOutlet weak var timePicker: UIPickerView!
    
    var taskText: String?
    var peopleText: String?
    var notesText: String?
    
    var data: [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    @IBAction func taskFieldTap(_ sender: Any) {
        self.view.endEditing(true)
        layer.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.pickerTime.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.pickerTime.bounds.height - (self.tabBarController?.tabBar.frame.height)!, width: self.pickerTime.bounds.width, height: self.pickerTime
                .bounds.height)
        }
        
    }
    
    @IBAction func selectTimeDidTap(_ sender: UIButton) {
        layer.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.pickerTime.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.pickerTime.bounds.width, height: self.pickerTime.bounds.height)
        }
    }
    
    @IBAction func saveChangeDidTap(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = " "
        layer.isHidden = true
        notesField.isEditable = true
        
        timePicker.dataSource = self
        timePicker.delegate = self
        
        taskNameField.text = taskText
        personWorkingField.text = peopleText
        notesField.text = notesText
        
    }
    
}
