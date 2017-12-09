//
//  SprintPlanningTableViewController.swift
//  IndomitableProject
//
//  Created by Martinus on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

class TaskTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var taskTable: UITableView!

    let section: [String] = ["Requirement", "Design", "Coding", "Testing"]
    var data: [[Any]] = []
    
    var tempMemberCount = [String]()
    var tempNote = [String]()
    var tempDesc = [String]()
    var tempDay = [String]()
    var filteredDesc = [String]()
    var filteredDay = [String]()
    var searchController = UISearchController()
    var resultController = UITableViewController()
    
    var tempDescForSend: String = ""
    var tempDayForSend: String = ""
    var tempMemberCountForSend: String = ""
    var tempNoteForSend: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data.append(RequirementTasks.fetchData())
        data.append(DesignTasks.fetchData())
        data.append(CodingTasks.fetchData())
        data.append(TestingTasks.fetchData())
        
        taskTable.dataSource = self
        taskTable.delegate = self

        //search controller
        searchController = UISearchController(searchResultsController: resultController)
        taskTable.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        
        for index in 0..<data.count {
            for ind in 0..<data[index].count{
                if index == 0{
                    let dataString: RequirementTasks = self.data[index][ind] as! RequirementTasks
                    tempDesc.append(dataString.event)
                    tempDay.append(dataString.day)
                    tempNote.append(dataString.note)
                    tempMemberCount.append(dataString.memberCount)
                }
                else if index == 1{
                    let dataString: DesignTasks = self.data[index][ind] as! DesignTasks
                    tempDesc.append(dataString.event)
                    tempDay.append(dataString.day)
                    tempNote.append(dataString.note)
                    tempMemberCount.append(dataString.memberCount)
                }
                else if index == 2{
                    let dataString: CodingTasks = self.data[index][ind] as! CodingTasks
                    tempDesc.append(dataString.event)
                    tempDay.append(dataString.day)
                    tempNote.append(dataString.note)
                    tempMemberCount.append(dataString.memberCount)
                }
                else if index == 3{
                    let dataString: TestingTasks = self.data[index][ind] as! TestingTasks
                    tempDesc.append(dataString.event)
                    tempDay.append(dataString.day)
                    tempNote.append(dataString.note)
                    tempMemberCount.append(dataString.memberCount)
                }
            }
            
        }
        
        //initialize navigation controller
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3120126724, green: 0.8384783864, blue: 0.09061203152, alpha: 1)
    }
    
   func updateSearchResults(for searchController: UISearchController) {
        filteredDesc = tempDesc.filter({ (array:String) -> Bool in
            if array.containsIgnoringCase(find: searchController.searchBar.text!){
                return true
            }else{
                return false
            }
        })
        for ind in 0..<filteredDesc.count{
            filteredDay.append(getDayAfterSearch(string: filteredDesc[ind]))
        }
        resultController.tableView.reloadData()
   }
    
    // declaration section's name
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !(searchController.isActive){
            return self.section[section]
        }else{
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == resultController.tableView {
            return 1
        }
        else{
            return self.section.count
        }
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !(searchController.isActive){
            return data[section].count
        }else{
            return filteredDesc.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath) as! TaskTableViewCell
        if tableView == resultController.tableView && searchController.isActive{
            cell.dayLabel.text = filteredDay[indexPath.row]
            cell.descLabel.text = filteredDesc[indexPath.row]
        }else{
            if indexPath.section == 0{
                let dataString: RequirementTasks = self.data[indexPath.section][indexPath.row] as! RequirementTasks
                cell.dayLabel.text = dataString.day
                cell.descLabel.text = dataString.event
            }
            else if indexPath.section == 1{
                let dataString: DesignTasks = self.data[indexPath.section][indexPath.row] as! DesignTasks
                cell.dayLabel.text = dataString.day
                cell.descLabel.text = dataString.event
            }
            else if indexPath.section == 2{
                let dataString: CodingTasks = self.data[indexPath.section][indexPath.row] as! CodingTasks
                cell.dayLabel.text = dataString.day
                cell.descLabel.text = dataString.event
            }
            else if indexPath.section == 3{
                let dataString: TestingTasks = self.data[indexPath.section][indexPath.row] as! TestingTasks
                cell.dayLabel.text = dataString.day
                cell.descLabel.text = dataString.event
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let b = tableView.cellForRow(at: indexPath) as! TaskTableViewCell
        
        if searchController.isActive {
            searchController.isActive = false
        }
        tempDescForSend = b.descLabel.text!
        tempDayForSend = b.dayLabel.text!
        tempMemberCountForSend = getMemberCountstring(string: b.descLabel.text!)
        tempNoteForSend = getNotestring(string: b.descLabel.text!)
        
        self.performSegue(withIdentifier: "detailTaskSegue", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailTaskSegue" {
            let destination = segue.destination as! DetailTaskViewController
            destination.taskName = tempDescForSend
            destination.dayLeftText = tempDayForSend
            destination.peopleWorkingText = tempMemberCountForSend
            destination.notesText = tempNoteForSend
        }
    }
    
    func getDayAfterSearch(string: String) -> String{
        return tempDay[tempDesc.index(of: string)!]
    }
    
    func getMemberCountstring(string: String) -> String{
        return tempMemberCount[tempDesc.index(of: string)!]
    }
    
    func getNotestring(string: String) -> String{
        return tempNote[tempDesc.index(of: string)!]
    }
}

extension String {
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}

protocol SelectedCellProtocol {
    func didSelectedCell(text: String)
}

//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}

