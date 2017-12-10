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
    var dayLeftText: String?
    var peopleWorkingText: String?
    var notesText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameLabel?.text = taskName
        dayLeftLabel?.text = "\(dayLeftText!) \ndays left"
        peopleWorkingLabel?.text = "\(peopleWorkingText!) Person(s)"
        notesLabel?.text = notesText
        var date = Date()
        let calendar = Calendar.current
        date = calendar.date(byAdding: .day, value: Int(dayLeftText!)!, to: date)!
        
        deadlineLabel?.text = "\(calendar.component(.day, from: date)) - \(calendar.component(.month, from: date)) - \(calendar.component(.year, from: date))"
    }
    
    @IBAction func seeTipsDidTap() {
        
    }
    
    @IBAction func changeTask() {
        
    }
    
}
