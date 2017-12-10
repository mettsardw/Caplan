//
//  EditTaskViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/10/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class EditTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var layer: UIView!
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var personWorkingField: UITextField!
    @IBAction func deleteButton(_ sender: UIButton) {
    }
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var pickerTime: UIView!
    @IBOutlet weak var timePicker: UIPickerView!
    
    var taskText: String?
    var peopleText: String?
    var notesText: String?
    var sourceObjectID: String?
    
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
        taskNameField.text = data[timePicker.selectedRow(inComponent: 0)]
    }
    
    @IBAction func saveChangeDidTap(_ sender: UIButton) {
        let container = getContainer()
        let projectFetch = NSFetchRequest<NSManagedObject>(entityName: "ProjectCore")
        do {
            let projects: [ProjectCore] = try container.fetch(projectFetch) as! [ProjectCore]
            let projectSprints: [SprintCore] = projects[0].sprintCore?.allObjects as! [SprintCore]
            for sprint in projectSprints {
                let sprintTasks: [TaskCore] = sprint.tasks?.allObjects as! [TaskCore]
                for task in sprintTasks {
                    let taskEvents: [EventCore] = task.event?.allObjects as! [EventCore]
                    for event in taskEvents {
                        let objectID = String(describing: event.objectID)
                        if objectID == sourceObjectID {
                            event.setValue(taskNameField.text, forKey: "type")
                            event.setValue(Int(personWorkingField.text!), forKey: "memberCount")
                            event.setValue(notesField.text, forKey: "notes")
                            //event.setValue(5, forKey: "point")
                            saveData(targetContainer: container)
                        }
                    }
                }
            
            }
            
        } catch _ as NSError {
            print("error")
        }
        project = Project()
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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddSprintViewController.dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dissmissKeyboard(){
        view.endEditing(true)
    }
    
}
