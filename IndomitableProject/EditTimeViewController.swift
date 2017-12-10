//
//  EditTimeViewController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class EditTimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var layer: UIView!
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var selectUnit: UIButton!
    
    var data: [String] = ["days", "months", "years"]
    var parentTimeLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.isHidden = true
        
        timePicker.dataSource = self
        timePicker.delegate = self
        
        //pas di view did load harusnya datanya ud dapet
        
        mainLabel.text = "edit time limit..."
        
        timeField.delegate = self
    }
    
    @IBAction func selectUnit(_ sender: UIButton) {
        layer.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.pickerContainer.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.pickerContainer.bounds.height - (self.tabBarController?.tabBar.frame.height)!, width: self.pickerContainer.bounds.width, height: self.pickerContainer.bounds.height)
        }
    }
    
    @IBAction func selectButtonDidTap(){
        layer.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.pickerContainer.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.pickerContainer.bounds.width, height: self.pickerContainer.bounds.height)
        }
        selectUnit.titleLabel?.text = data[timePicker.selectedRow(inComponent: 0)]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    //create a function that will be done in done click
    @IBAction func doneButtonDidTap(){
        //munculin alert
        if selectUnit.titleLabel?.text != "Select Units" {
            var dayLimit = 0
            if selectUnit.titleLabel?.text == "days" {
                dayLimit = Int(timeField.text!)!
            } else if selectUnit.titleLabel?.text == "months" {
                dayLimit = Int(timeField.text!)! * 30
            } else if selectUnit.titleLabel?.text == "years" {
                dayLimit = Int(timeField.text!)! * 365
            }
            parentTimeLabel?.text = "\(dayLimit) days left"
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == timeField {
            view.endEditing(true)
        }
        return false
    }
}


