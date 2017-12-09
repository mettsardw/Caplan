//
//  Task.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

enum Tasks: String {
    case Requirement
    case Design
    case Coding
    case Testing
    case Review
    case noMatchFound
    
}

class Task{
    var name: Tasks
    var events: [Event]
    var priority: Int
    
    init(name: Tasks) {
        self.name = name
        self.priority = 1 // optional
        self.events = []
    }
    
    
}
