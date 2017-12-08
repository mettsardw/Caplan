//
//  ResetViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/7/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {

    var parentProjectLabel: UILabel?
    var parentDaysLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func noButtonDidTap() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func yesButtonDidTap() {
        
        parentProjectLabel?.text = "MyPlan"
        parentDaysLabel?.text = "100 days left"
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
