//
//  PlanTableViewCell.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 29/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class PlanTableViewCell: UITableViewCell {
    @IBOutlet weak var bubble: PlanBubble!
    @IBOutlet weak var upline: PlanLine!
    @IBOutlet weak var downline: PlanLine!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var days: UILabel!
}
