//
//  EditTimeViewController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class EditTimeViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pas di view did load harusnya datanya ud dapet
        
        mainLabel.text = "edit time limit..."
    }
    
    //create a function that will be done in done click
    @IBAction func doneButtonDidTap(){
        //munculin alert
    }
}


