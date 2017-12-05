//
//  SideMenuTableViewController.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    @IBOutlet weak var projectImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "bunny")
        
        projectImage.image = image
        projectImage.layer.cornerRadius = (projectImage.frame.width) / 2.0
        projectImage.clipsToBounds = true
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
