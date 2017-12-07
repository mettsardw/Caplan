//
//  ProjectCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 06/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension ProjectCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectCore> {
        return NSFetchRequest<ProjectCore>(entityName: "ProjectCore")
    }

    @NSManaged public var name: String?
    @NSManaged public var duration: Int64
    @NSManaged public var durationUnit: String?
    @NSManaged public var sprintCore: NSSet?
    @NSManaged public var userCore: UserCore?

}

// MARK: Generated accessors for sprintCore
extension ProjectCore {

    @objc(addSprintCoreObject:)
    @NSManaged public func addToSprintCore(_ value: SprintCore)

    @objc(removeSprintCoreObject:)
    @NSManaged public func removeFromSprintCore(_ value: SprintCore)

    @objc(addSprintCore:)
    @NSManaged public func addToSprintCore(_ values: NSSet)

    @objc(removeSprintCore:)
    @NSManaged public func removeFromSprintCore(_ values: NSSet)

}
