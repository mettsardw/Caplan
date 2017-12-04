//
//  HelpNextStepViewController.swift
//  IndomitableProject
//
//  Created by Samuel Theodorus Junius on 12/4/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class HelpNextStepViewController: UIViewController {

    @IBOutlet weak var judulLabel: UILabel!
    var judulText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        judulLabel.text = judulText
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
