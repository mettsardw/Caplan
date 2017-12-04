//
//  TaskCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 04/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskCore> {
        return NSFetchRequest<TaskCore>(entityName: "TaskCore")
    }

    @NSManaged public var memberCount: Int64
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var point: Int64
    @NSManaged public var priority: Int64
    @NSManaged public var duration: Int64
    @NSManaged public var durationUnit: String?
    @NSManaged public var event: NSSet?

}

// MARK: Generated accessors for event
extension TaskCore {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: EventCore)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: EventCore)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}
