//
//  SprintPlanning.swift
//  IndomitableProject
//
//  Created by Martinus on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

struct SprintPlanning{
    
    var day: String
    var desc: String
    
    static func fetchData() -> [SprintPlanning]{
        var sprintPlanning: [SprintPlanning] = []
        
        sprintPlanning.append(SprintPlanning(day: "7", desc: "This is the first task"))
        sprintPlanning.append(SprintPlanning(day: "8", desc: "This is the second task"))
        sprintPlanning.append(SprintPlanning(day: "9", desc: "This is the third task"))
        
        return sprintPlanning
    }
}
