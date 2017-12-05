//
//  RequirementTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct RequirementTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [RequirementTasks]{
        var requirementTasks: [RequirementTasks] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskCore")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Requirement")
        
        do{
            let requirements: [TaskCore] = try container.fetch(fetchRequest) as! [TaskCore]
            
            for requirement in requirements {
                let taskEvents: [EventCore] = requirement.event?.allObjects as! [EventCore]
                
                for index in 0..<taskEvents.count{
                    requirementTasks.append(RequirementTasks(day: String(describing: taskEvents[index].duration), event: taskEvents[index].type!))
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return requirementTasks
    }
}

