//
//  HelpViewController.swift
//  IndomitableProject
//
//  Created by Samuel Theodorus Junius on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class HelpViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
    
  

}
