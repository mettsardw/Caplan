//
//  ProjectCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 09/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension ProjectCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectCore> {
        return NSFetchRequest<ProjectCore>(entityName: "ProjectCore")
    }

    @NSManaged public var duration: Int64
    @NSManaged public var durationUnit: String?
    @NSManaged public var name: String?
    @NSManaged public var sprintCore: NSSet?
    @NSManaged public var userCore: UserCore?

}

// MARK: Generated accessors for sprintCore
extension ProjectCore {

    @objc(insertObject:inSprintCoreAtIndex:)
    @NSManaged public func insertIntoSprintCore(_ value: SprintCore, at idx: Int)

    @objc(removeObjectFromSprintCoreAtIndex:)
    @NSManaged public func removeFromSprintCore(at idx: Int)

    @objc(insertSprintCore:atIndexes:)
    @NSManaged public func insertIntoSprintCore(_ values: [SprintCore], at indexes: NSIndexSet)

    @objc(removeSprintCoreAtIndexes:)
    @NSManaged public func removeFromSprintCore(at indexes: NSIndexSet)

    @objc(replaceObjectInSprintCoreAtIndex:withObject:)
    @NSManaged public func replaceSprintCore(at idx: Int, with value: SprintCore)

    @objc(replaceSprintCoreAtIndexes:withSprintCore:)
    @NSManaged public func replaceSprintCore(at indexes: NSIndexSet, with values: [SprintCore])

    @objc(addSprintCoreObject:)
    @NSManaged public func addToSprintCore(_ value: SprintCore)

    @objc(removeSprintCoreObject:)
    @NSManaged public func removeFromSprintCore(_ value: SprintCore)

    @objc(addSprintCore:)
    @NSManaged public func addToSprintCore(_ values: NSSet)

    @objc(removeSprintCore:)
    @NSManaged public func removeFromSprintCore(_ values: NSSet)

}
