//
//  TaskButton.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

@IBDesignable
class TaskButton: UIButton {
    var positionX: CGFloat?
    var positionY: CGFloat?
    var color: UIColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, ypos y: CGFloat, color: UIColor) {
        super.init(frame: CGRect(x: 0, y: y, width: 20, height: 20))
        self.color = color
        //self.center = CGPoint(x: positionX!, y: positionY!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        color.setFill()
        path.fill()
    }
    
    //define what happens on click
    func taskButtonDidTap(sender:UIButton!) {
        if sender.titleLabel?.text != nil {
            print("hdjshdjhs")
        } else {
            print("nowhere")
            
        }
        
    }
    
    func changeColor(_ color: UIColor) {
        color.setStroke()
    }
}
