//
//  Event.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

enum Types{
    case SprintPlanning
    case Sprint
    case DailyScrum
    case Review
    case Retrospective
}

class Event{
    var timeBoxed: Time
    var type: Types
    var memberCount: Int
    
    init(timeBoxed: Time, type: Types, memberCount: Int) {
        self.timeBoxed = timeBoxed
        self.type = type
        self.memberCount = memberCount
    }
}
