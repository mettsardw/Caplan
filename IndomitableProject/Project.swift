//
//  Project.swift
//  IndomitableProject
//
//  Created by Metta Saridewi Wahab on 27/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import Foundation
import UIKit

class Project {
    var user: User
    var schedule: Schedule
    var name: String
    var image: UIImage?
    
    init() {
        //set with default values
        user = User()
        schedule = Schedule()
        name = "MyProject"
        //image is optional
    }
    
    func getTasks(index: Int) -> [Task] {
        return self.schedule.plans[index].tasks
    }
}
