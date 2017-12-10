//
//  AddSprintViewController.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 10/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class AddSprintViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var dataUnit: [String] = ["days","month"]
    
    @IBOutlet weak var alertDuration: UILabel!
    
    @IBOutlet weak var alertName: UILabel!
    @IBOutlet weak var layer: UIView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var durationText: UITextField!
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var selectedUnit: UIButton!
    @IBOutlet weak var unitPicker: UIPickerView!
    @IBAction func unitSelected(_ sender: UIButton) {
        layer.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.pickerContainer.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.pickerContainer.bounds.width, height: self.pickerContainer.bounds.height)
        }
        selectedUnit.titleLabel?.text = dataUnit[unitPicker.selectedRow(inComponent: 0)]
    }
    
    @IBAction func selectUnit(_ sender: UIButton) {
        layer.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.pickerContainer.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.pickerContainer.bounds.height - (self.tabBarController?.tabBar.frame.height)!, width: self.pickerContainer.bounds.width, height: self.pickerContainer.bounds.height)
        }
    }
    @IBAction func durationStepper(_ sender: UIStepper) {
        durationText.text = String(format: "%.0f",sender.value)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        if durationText.text == "" || durationText.text == "0" || selectedUnit.titleLabel?.text == "Select unit"{
            alertDuration.text = "set duration & unit"
        }else{
            alertDuration.text = ""
        }
        if nameText.text == "" {
            alertName.text = "set your sprint name!"
        }else{
            alertName.text = ""
        }
        if durationText.text == "" || durationText.text == "0" || selectedUnit.titleLabel?.text == "Select unit" || nameText.text == "" {
            
        }else{
            let container = getContainer()
            let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
            do {
                let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
                projects[0].addToSprintCore(setSprint(name: nameText.text!, duration: Int(durationText.text!)!, unit: (selectedUnit.titleLabel?.text)!))
                saveData(targetContainer: container)
            } catch _ as NSError {
                print("error")
            }
            
            project = Project()
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataUnit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataUnit[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unitPicker.dataSource = self
        unitPicker.delegate = self
        layer.isHidden = true
        alertName.text = ""
        alertDuration.text = ""
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddSprintViewController.dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dissmissKeyboard(){
        view.endEditing(true)
    }
}
