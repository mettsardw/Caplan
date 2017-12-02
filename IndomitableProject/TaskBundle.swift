//
//  TaskBundle.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TaskBundle: UIView {
    var bigFrame: CGRect?
    var btn: TaskButton?
    var line: TaskLine?
    var taskName: UILabel?
    var days: UILabel?
    var task: Task?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, from y: CGFloat, length: CGFloat, task: Task, color: UIColor) {
        //set big frame
        bigFrame = CGRect(x: frame.width/2, y: y, width: 20, height: length)
        super.init(frame: bigFrame!)
        self.task = task
        
        //set insides (wait for initializer with Task class
        line = TaskLine(frame: bigFrame!, from: y, length: length, color: color)
        btn = TaskButton(frame: bigFrame!, ypos: y, color: color)
        
        //declare task label here
        taskName = UILabel()
        //taskName?.text = task.name.rawValue
        taskName?.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        let labelFrame = bigFrame!
        taskName?.frame = labelFrame
        taskName?.textAlignment = NSTextAlignment.left
        updateLabelFrame(label: taskName!, y: y) //set label position
        
        //declare days here
        days = UILabel()
        if task.time.unit == .days {
            days?.text = "\(task.time.duration)d" //change with number of days according to assigned task and unit
        }
        else if task.time.unit == .month{
            days?.text = "\(task.time.duration)m"
        }
        days?.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        days?.frame = labelFrame
        days?.textAlignment = .right //alignment troubles
        days?.font = UIFont(name: "Avenir", size: 11)
        updateLabelFrame(label: days!, y: CGFloat(y + length/2))
        days?.frame.origin.x += 40
        
        //add to view
        addSubview(btn!)
        addSubview(line!)
        
        addSubview(taskName!)
        addSubview(days!)
        
    }
    
    func updateLabelFrame(label: UILabel, y: CGFloat) {
        let maxSize = CGSize(width: 150, height: 300)
        let size = label.sizeThatFits(maxSize)
        label.frame = CGRect(origin: CGPoint(x: -70, y: y), size: size)
    }
}
