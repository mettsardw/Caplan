//
//  SprintPlanning.swift
//  IndomitableProject
//
//  Created by Martinus on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

struct PlanTasks{
    
    var day: String
    var desc: String
    
    static func fetchData() -> [PlanTasks]{
        var planTasks: [PlanTasks] = []
        
        planTasks.append(PlanTasks(day: "7", desc: "This is the first task"))
        planTasks.append(PlanTasks(day: "8", desc: "That is the second task"))
        planTasks.append(PlanTasks(day: "9", desc: "This is the third task"))
        
        return planTasks
    }
}
