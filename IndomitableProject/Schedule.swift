//
//  Schedule.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

class Schedule{
    var plans: [Plan]
    var currentPlan: Plan
    
    init() {
        plans = []
        currentPlan = Plan(name: "Sprint Planning")
    }
}
