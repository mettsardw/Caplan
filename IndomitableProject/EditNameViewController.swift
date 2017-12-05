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
    
    var descText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pas di view did load harusnya datanya ud dapet
        
        mainLabel.text = descText
        textField.placeholder = "HSAJHAJSHS"
    }
    
    
}

