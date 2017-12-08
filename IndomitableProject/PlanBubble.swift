//
//  PlanBubble.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

@IBDesignable
class PlanBubble: UIButton {
    var color: UIColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15.0)
        
        //last line
        path.close()
        
        //determine color
        color.setFill()
        path.fill()
        
        //draw the stroke
        color.setStroke()
        path.stroke()
        
        //clip to bounds
        self.clipsToBounds = true
        
//        // Size of rounded rectangle
//        let rectWidth = rect.width
//        let rectHeight = rect.height
//
//        // Find center of actual frame to set rectangle in middle
//        let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
//        let yf:CGFloat = (self.frame.height - rectHeight) / 2
//
//        let ctx: CGContext = UIGraphicsGetCurrentContext()!
//        ctx.saveGState()
//
//        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
//        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: 6.0).cgPath
//
//        ctx.addPath(clipPath)
//        ctx.setFillColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
//
//        ctx.closePath()
//        ctx.fillPath()
//        ctx.restoreGState()
    }
}
