//
//  TestingTasks.swift
//  IndomitableProject
//
//  Created by Martinus on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit
import CoreData

struct TestingTasks {
    var day: String
    var event: String
    
    static func fetchData() -> [TestingTasks]{
        var testingTasks: [TestingTasks] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskCore")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Testing")
        
        do{
            let tests: [TaskCore] = try container.fetch(fetchRequest) as! [TaskCore]
            
            for test in tests {
                let taskEvents: [EventCore] = test.event?.allObjects as! [EventCore]
                
                for index in 0..<taskEvents.count{
                    testingTasks.append(TestingTasks(day: String(describing: taskEvents[index].duration), event: taskEvents[index].type!))
                }
            }
        }catch _ as NSError {
            print("error")
        }
        return testingTasks
    }
}

