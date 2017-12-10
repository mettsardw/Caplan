//
//  TipsViewController.swift
//  IndomitableProject
//
//  Created by Samuel Theodorus Junius on 12/6/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
    
    @IBOutlet weak var kotakTextIsi: UITextView!
    @IBOutlet weak var labelJudul: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var teks1: String = ""
    
    let koleksiJudul = ["Time Management","Master Scrum Role","Do It Around The Task Board","Actually Stand","Avoid Interruptions","Focus On Your Team"]
    
    let koleksiIsi = ["For example, Scrum is described as a lightweight process, but it carries significant process overhead that increases as cycle time contracts. A typical calculation for Scrum overhead when using two-week sprints might look like this:\n 4 hours of Sprint Planning per iteration. (32 hours per team)\n2 hours of Sprint Review per iteration. (16 hours per team)\n2 hours of Sprint Retrospective per iteration. (16 hours per team)\n15 minutes per day for daily stand-ups. (2.5 hours per team)\n2 hours of Backlog Grooming per iteration. (4 hours per Scrum Master/Product Owner pair)\n1 hour per day (minimum) for reporting, or generating artifacts like burn-down charts, or communicating impediments to the parent organization. (10 hours per Scrum Master)","The Scrum Master is a servant-leader for the Scrum Team. The Scrum Master helps those outside the Scrum Team understand which of their interactions with the Scrum Team are helpful and which aren’t. The Scrum Master helps everyone change these interactions to maximize the value created by the Scrum Team.","Have team members point at stories and tasks on the task board as they talk about their work. This keeps the focus on work for the sprint and makes it obvious when the talk becomes unrelated to the sprint.","It shouldn’t be necessary for us to stand to have a short, high-energy meeting, but it really seems to help. If your team has started sitting for the Daily Scrum and it’s running longer than 15 minutes, it might be time to try standing again. Set an example by standing for the whole meeting, and maybe ask one or two influential team members to do the same. Combining this with #1 makes it feel less awkward.","Though each Scrum team has a sprint backlog that contains all the tasks for a sprint, there might still be some urgent tasks that interrupt the workflow. Though such interruptions seem to be inevitable, it’s recommended to avoid them. If your Scrum team has to cope with the tasks beyond a sprint backlog, it’ll be less productive and may even fail to deliver an increment of a product at the end of a sprint.","Many Scrum teams are focused on velocity, which is an amount of work a development team handles during a sprint. Lots of Scrum teams use story points to measure velocity. Though velocity is, undoubtedly, the most important metric in Scrum, it shouldn’t become a goal for your team. The Agile Manifesto clearly states that working software is more important than comprehensive documentation."]
    
    var indicator:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        
        //self.view.backgroundColor = UIColor(displayP3Red: 119, green: 211, blue: 83, alpha: 0.8)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        prevButton.isHidden = true
        labelJudul.text = koleksiJudul[0]
        kotakTextIsi.text = koleksiIsi[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        if indicator != koleksiJudul.count-1 {
            indicator += 1
            labelJudul.text = koleksiJudul[indicator]
            kotakTextIsi.text = koleksiIsi[indicator]
            prevButton.isHidden = false
            if indicator == koleksiJudul.count-1{
                nextButton.isHidden = true
            }
        }
    }
    
    @IBAction func prevButtonDidTap(_ sender: UIButton) {
        if indicator != 0 {
            indicator -= 1
            labelJudul.text = koleksiJudul[indicator]
            kotakTextIsi.text = koleksiIsi[indicator]
            nextButton.isHidden = false
            if indicator == 0{
                prevButton.isHidden = true
            }
        }
    }
    
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        removeAnimate()
    }
    
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        }
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.view.alpha = 0.0;
        }) { (finished: Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
        }
    }
    
    
    /*      /// CODINGAN INI NANTI MASUKIN KE BUTTON YANG ADA
         @IBAction func rateButton(sender:UIBarButtonItem) {
         let popOverVC = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "a") as! PopUpViewController
         self.addChildViewController(popOverVC)
         popOverVC.view.frame = self.view.frame
         self.view.addSubview(popOverVC.view)
         popOverVC.didMove(toParentViewController:  self)
         }
     
     */
    
    
}
