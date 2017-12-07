//
//  DetailTaskViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/7/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {

    @IBOutlet weak var dayLeftLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var peopleWorkingLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var taskNotesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func editTask(_ sender: Any) {
        // untuk edit task
    }
    
    @IBAction func seeTipsDidTap(_ sender: UIButton) {
        // untuk see tips
    }
}
