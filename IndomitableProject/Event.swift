//
//  Event.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 28/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation


class Event{
    var timeBoxed: Time
    var type: String
    var memberCount: Int
    var notes: String
    var point: Int
    
    init(timeBoxed: Time, type: String, memberCount: Int, notes: String, point: Int) {
        self.timeBoxed = timeBoxed
        self.type = type
        self.memberCount = memberCount
        self.notes = notes
        self.point = point
    }
}
