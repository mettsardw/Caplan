//
//  SprintCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 09/12/17.
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
    @NSManaged public var project: ProjectCore?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension SprintCore {

    @objc(insertObject:inTasksAtIndex:)
    @NSManaged public func insertIntoTasks(_ value: TaskCore, at idx: Int)

    @objc(removeObjectFromTasksAtIndex:)
    @NSManaged public func removeFromTasks(at idx: Int)

    @objc(insertTasks:atIndexes:)
    @NSManaged public func insertIntoTasks(_ values: [TaskCore], at indexes: NSIndexSet)

    @objc(removeTasksAtIndexes:)
    @NSManaged public func removeFromTasks(at indexes: NSIndexSet)

    @objc(replaceObjectInTasksAtIndex:withObject:)
    @NSManaged public func replaceTasks(at idx: Int, with value: TaskCore)

    @objc(replaceTasksAtIndexes:withTasks:)
    @NSManaged public func replaceTasks(at indexes: NSIndexSet, with values: [TaskCore])

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: TaskCore)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: TaskCore)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}
