//
//  Plan.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

class Sprint{
    var name: String
    var duration: Int // total duration of all tasks inside
    var tasks: [Task]
    var limit: Int
    
    init(name: String) {
        //set default values
        self.name = name
        self.duration = 0
        self.tasks = []
        self.limit = 0
        
        //modified logic
        limit = self.recommendedLimit() // change content of function with calculation of rec limit of days
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        duration += task.time.duration
    }
    
    func getTask(named: String) -> Task {
        for task in tasks{
            if task.name.rawValue == named{
                return task
            }
        }

        return Task(name: .noMatchFound, memberCount: 0, time: Time(duration: 0, unit: .days))
    }
    
    func getUrgentTask() -> Task {
        return tasks[0]
    }
    
    func recommendedLimit() -> Int{
        if(name == "Planning"){
            //calculations here, weight * total of days etc
        }
        
        return 0 // return variable
    }
}
