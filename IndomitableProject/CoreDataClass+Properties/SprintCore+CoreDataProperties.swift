//
//  SprintCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 06/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension SprintCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SprintCore> {
        return NSFetchRequest<SprintCore>(entityName: "SprintCore")
    }

    @NSManaged public var duration: Int64
    @NSManaged public var durationUnit: String?
    @NSManaged public var name: String?
    @NSManaged public var tasks: NSSet?
    @NSManaged public var project: ProjectCore?

}

// MARK: Generated accessors for tasks
extension SprintCore {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: TaskCore)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: TaskCore)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}
