//
//  TaskSprintSetView.swift
//  IndomitableProject
//
//  Created by yudi on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskSprintSetView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var noteText: UITextView!
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
    var sprintID: [String] = []
    var sourceActivities: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "successView" {
            let destination = segue.destination as! TaskAddedInfoView
            destination.sourceTask = self.sourceTask
            destination.sourceSprintID = sprintID[sprintPicker.selectedRow(inComponent: 0)]
            destination.sourceMemberCount = Int(teamSet.text!)
            destination.sourceEvent = sourceActivities
            destination.sourceNotes = noteText.text
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
            if selectSprint.titleLabel?.text == "Select a Sprint..."{
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
        noteText.layer.borderWidth = 1
        noteText.layer.cornerRadius = 10
        noteText.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        for sprint in project.sprints {
            sprintData.append(sprint.name)
            sprintID.append(sprint.objectID)
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dissmissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        addKeyboardViewAdjustment()
    }
    
    func dissmissKeyboard(){
        view.endEditing(true)
    }
}

extension UIViewController
{
    /**
     Auto adjust the view's position when keyboard appear
     */
    func addKeyboardViewAdjustment()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
}

