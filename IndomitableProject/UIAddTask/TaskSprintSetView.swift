//
//  TaskSprintSetView.swift
//  IndomitableProject
//
//  Created by yudi on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskSprintSetView: UIViewController {
    
    @IBOutlet weak var teamSet: UITextField!
    @IBOutlet weak var durationSet: UITextField!
    
    @IBAction func durationSetStepper(_ sender: UIStepper) {
        durationSet.text = String(format: "%.0f",sender.value)
    }
    @IBAction func teamSetStepper(_ sender: UIStepper) {
        teamSet.text = String(format: "%.0f",sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
