//
//  Time.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation

struct Time {
    var duration: Int
    var unit: Unit
    
    init(duration: Int, unit: Unit) {
        self.duration = duration
        self.unit = unit
    }
    
    enum Unit {
        case days
        case month
    }
}
