//
//  TaskLine.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

@IBDesignable
class TaskLine: UIView {
    var color: UIColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, from y: CGFloat, length: CGFloat, color: UIColor) {
        self.color = color
        super.init(frame: CGRect(x: 0, y: y, width: 20, height: length))
        
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        //set up the width and height variables
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = 3.0
        
        //move the initial point of the path
        plusPath.move(to: CGPoint(
            x: frame.width/2,
            y: 0.0))
        
        plusPath.addLine(to: CGPoint(
            x: frame.width/2,
            y: frame.height))
        
        //set the stroke color
        color.setStroke()
        
        //draw the stroke
        plusPath.stroke()
        
        //clip to bounds
        self.clipsToBounds = true
    }
}
