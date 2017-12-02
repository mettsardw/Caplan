//
//  SprintPlanningTableViewController.swift
//  IndomitableProject
//
//  Created by Martinus on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var taskTable: UITableView!
    
    let section: [String] = ["Plan", "Code"]
    var data: [[PlanTasks]] = [PlanTasks.fetchData(), PlanTasks.fetchData()]
    
    var tempDesc = [String]()
    var tempDay = [String]()
    var filteredDesc = [String]()
    var searchController = UISearchController()
    var resultController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.dataSource = self
        taskTable.delegate = self
        
        //search controller
        searchController = UISearchController(searchResultsController: resultController)
        taskTable.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
        
        for index in 0..<data.count {
            for ind in 0..<data[index].count{
                tempDesc.append(data[index][ind].desc)
            }
        }
    }
    
   func updateSearchResults(for searchController: UISearchController) {
        filteredDesc = tempDesc.filter({ (array:String) -> Bool in
            if array.contains(searchController.searchBar.text!){
                return true
            }else{
                return false
            }
        })
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
            return filteredDesc.count
        }
        else{
            return self.section.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !(searchController.isActive){
            return data[section].count
        }else{
            print(filteredDesc.count)
            return filteredDesc.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath) as! TaskTableViewCell
        
        if tableView == resultController.tableView {
            //cell.dayLabel.text = self.data[indexPath.section][indexPath.row].day
            cell.descLabel.text = filteredDesc[indexPath.row]
        }else{
            cell.dayLabel.text = self.data[indexPath.section][indexPath.row].day
            cell.descLabel.text = self.data[indexPath.section][indexPath.row].desc
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
