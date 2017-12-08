//
//  EditNameViewController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 04/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class EditNameViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var descText: String?
    var descLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //pas di view did load harusnya datanya ud dapet
        
        mainLabel.text = "edit project name..."
        textField.placeholder = "MyProject"
    }
    
    @IBAction func unitSelecting(){
        
    }
    
    //create a function that will be done in done click
    @IBAction func doneButtonDidTap(){
        //munculin alert
        descLabel?.text = textField.text
        navigationController?.popToRootViewController(animated: true)
    }
}

