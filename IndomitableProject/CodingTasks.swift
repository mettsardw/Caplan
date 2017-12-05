//
//  CodingTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct CodingTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [CodingTasks]{
        var codingTasks: [CodingTasks] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskCore")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Coding")
        
        do{
            let codes: [TaskCore] = try container.fetch(fetchRequest) as! [TaskCore]
            
            for code in codes {
                let taskEvents: [EventCore] = code.event?.allObjects as! [EventCore]
                
                for index in 0..<taskEvents.count{
                    codingTasks.append(CodingTasks(day: String(describing: taskEvents[index].duration), event: taskEvents[index].type!))
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return codingTasks
    }
}

