//
//  TaskCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 09/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskCore> {
        return NSFetchRequest<TaskCore>(entityName: "TaskCore")
    }

    @NSManaged public var name: String?
    @NSManaged public var priority: Int64
    @NSManaged public var event: NSSet?
    @NSManaged public var sprint: SprintCore?

}

// MARK: Generated accessors for event
extension TaskCore {

    @objc(insertObject:inEventAtIndex:)
    @NSManaged public func insertIntoEvent(_ value: EventCore, at idx: Int)

    @objc(removeObjectFromEventAtIndex:)
    @NSManaged public func removeFromEvent(at idx: Int)

    @objc(insertEvent:atIndexes:)
    @NSManaged public func insertIntoEvent(_ values: [EventCore], at indexes: NSIndexSet)

    @objc(removeEventAtIndexes:)
    @NSManaged public func removeFromEvent(at indexes: NSIndexSet)

    @objc(replaceObjectInEventAtIndex:withObject:)
    @NSManaged public func replaceEvent(at idx: Int, with value: EventCore)

    @objc(replaceEventAtIndexes:withEvent:)
    @NSManaged public func replaceEvent(at indexes: NSIndexSet, with values: [EventCore])

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: EventCore)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: EventCore)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}
