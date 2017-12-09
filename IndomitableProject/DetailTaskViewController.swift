//
//  DetailTaskViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/8/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {
    
    @IBOutlet weak var dayLeftLabel: UILabel?
    @IBOutlet weak var taskNameLabel: UILabel?
    @IBOutlet weak var peopleWorkingLabel: UILabel?
    @IBOutlet weak var notesLabel: UILabel?
    @IBOutlet weak var deadlineLabel: UILabel?
    
    var taskName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameLabel?.text = taskName
    }
    
    @IBAction func seeTipsDidTap() {
        
    }
    
    @IBAction func changeTask() {
        
    }
    
}
