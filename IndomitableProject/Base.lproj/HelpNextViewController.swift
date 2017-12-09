//
//  HelpNextViewController.swift
//  IndomitableProject
//
//  Created by Samuel Theodorus Junius on 12/4/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class HelpNextViewController: UIViewController {
    @IBOutlet weak var judulLabel: UILabel!
    @IBOutlet weak var kotakIsi: UITextView!
    var textUtama: String?
    var textIsi: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        judulLabel.text = textUtama
        kotakIsi.text = textIsi
        // Do any additional setup after loading the view.
    }


}
