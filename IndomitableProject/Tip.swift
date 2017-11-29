//
//  Tip.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

class Tip {
    var plan: Plan
    var category: Task
    var contents: String
    var frequency: Int
    
    init(plan: Plan, category: Task, contents: String) {
        self.plan = plan
        self.category = category
        self.contents = contents // fetch content from core data etc
        frequency = 1 //set for interval or priority
    }
}
