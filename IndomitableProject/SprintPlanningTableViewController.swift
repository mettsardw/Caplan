//
//  SprintPlanningTableViewController.swift
//  IndomitableProject
//
//  Created by Martinus on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class SprintPlanningTableViewController: UITableViewController {

    @IBOutlet weak var sprintPlanningTable: UITableView!
    
    var data: [SprintPlanning] = SprintPlanning.fetchData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sprintPlanningTable.dequeueReusableCell(withIdentifier: "sprintPlanningCell", for: indexPath) as! SprintPlanningTableViewCell
        
        cell.dayLabel.text = data[indexPath.row].day
        cell.dayLabel.text = data[indexPath.row].day
        
        return cell
    }
}
