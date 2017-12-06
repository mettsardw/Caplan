//
//  Tip.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

class Tip {
    var sprint: Sprint
    var category: Task
    var contents: String
    var frequency: Int
    
    init(sprint: Sprint, category: Task, contents: String) {
        self.sprint = sprint
        self.category = category
        self.contents = contents // fetch content from core data etc
        frequency = 1 //set for interval or priority
    }
}
