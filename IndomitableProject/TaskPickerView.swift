//
//  TaskPickerView.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskPickerView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBAction func showActDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "taskDetail", sender: nil)
    }
    @IBOutlet weak var dataPicker: UIPickerView!
    var taskData: [String] = ["Requirement","Design","Coding","Testing","Review"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return taskData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return taskData[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskDetail"{
            
            let destination = segue.destination as! TaskActivitesView
            let selectedData: String = taskData[dataPicker.selectedRow(inComponent: 0)]
            
            destination.sourceTitle = selectedData
            if selectedData == "Requirement" {
                destination.dataActivites.append("Requirement Ghatering")
                destination.dataActivites.append("Requirement Analysis")
            }else if selectedData == "Design" { 
                destination.dataActivites.append("System Design")
                destination.dataActivites.append("Program Design")
            }
            else if selectedData == "Coding" {
                destination.dataActivites.append("Main")
                destination.dataActivites.append("Feature")
            }
            else if selectedData == "Testing" {
                destination.dataActivites.append("Unit Testing")
                destination.dataActivites.append("Integration Testing")
                destination.dataActivites.append("System Testing")
            }
            else if selectedData == "Review" {
                destination.dataActivites.append("Requirement fulfilled")
                destination.dataActivites.append("Performance")
                destination.dataActivites.append("Increment")
            }else{
                destination.dataActivites.append("yooman")
                destination.dataActivites.append("yooman")

            }
            
           // destination.countryText = countryData[dataPicker.selectedRow(inComponent: 0)]
           // destination.animalText = animalData[dataPicker.selectedRow(inComponent: 1)]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataPicker.dataSource = self
        dataPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
