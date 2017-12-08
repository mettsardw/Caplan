//
//  TimelineController.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TimelineController: UIViewController {
    var taskCount: Int = 0
    var taskButtons: [TaskButton] = []
    var taskLines: [TaskLine] = []
    var taskBundles: [TaskBundle] = []
    
    var scrollView: UIScrollView!
    
   // @IBOutlet weak var sideMenu: UIBarButtonItem!
    
    init(ofSprint no: Int)
    {
        super.init(nibName: nil, bundle: nil)
        
        //initiate the tasks inside the sprint No
        //task[0]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = view.bounds.size
        scrollView.autoresizingMask = .flexibleWidth
        
        //get tasks
        var count = 0
        for task in project.getTasks(index: 0){
            //print(task.name.rawValue)
            taskBundles.append(TaskBundle(frame: self.view.frame, from: CGFloat(50 + count * 50), length: 100.0, task: task, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
            taskBundles[taskBundles.endIndex-1].btn?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside) //add action for click
            taskBundles[taskBundles.endIndex-1].btn?.tag = taskBundles.endIndex-1
            scrollView.addSubview(taskBundles[taskBundles.endIndex-1])
            count += 1
        }
        
        //display buttons
        for index in 0..<taskCount {
            taskLines.append(TaskLine(frame: self.view.frame, from: CGFloat(100 + index*100), length: 100.0, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
            self.view.addSubview(taskLines[index])
            taskButtons.append(TaskButton(frame: self.view.frame, ypos: CGFloat(100 + index*100), color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
            self.view.addSubview(taskButtons[index])

            //edit index constant according to length? PR
//            taskBundles.append(TaskBundle(frame: self.view.frame, from: CGFloat(50 + index*50), length: 100.0))
//            scrollView.addSubview(taskBundles[index])
        }
        
        //touch up
        taskBundles.append(TaskBundle(frame: self.view.frame, from: CGFloat(50 + count * 50), length: 100.0, task: taskToIndicateEndOfProject(), color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
        scrollView.addSubview(taskBundles[taskBundles.endIndex-1])
        taskBundles[taskBundles.endIndex-1].line?.isHidden = true //line doesnt stretch past timeline
        
        //finish up view
        view.addSubview(scrollView)
        
        //side menu
        //self.sideMenuView(sideMenu: sideMenu)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction(sender: UIButton!) {
        let btn: UIButton = sender
        if btn.tag == 0 {
            dismiss(animated: true, completion: nil)
        }
    }
}
