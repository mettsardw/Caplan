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
    var notes: String
    var memberCount: Int
    var time: Time
    var points: Int
    var priority: Int
    
    init(name: Tasks, memberCount: Int, time: Time) {
        self.name = name
        self.notes = ""
        self.memberCount = memberCount
        self.time = time
        self.points = 100 //calculation goes here
        self.priority = 1 // optional
        self.events = []
    }
    
    
}
