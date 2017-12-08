//
//  ResetViewController.swift
//  IndomitableProject
//
//  Created by yudi on 12/8/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    
    var projectLabel: UILabel?
    var daysLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func noButtonDidTap(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func yesButtonDidTap(){
        
        projectLabel?.text = "MyPlan"
        daysLabel?.text = "100 days left"
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
