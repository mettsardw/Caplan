//
//  ProjectCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 05/12/17.
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
    @NSManaged public var taskCore: NSSet?
    @NSManaged public var userCore: UserCore?

}

// MARK: Generated accessors for taskCore
extension ProjectCore {

    @objc(addTaskCoreObject:)
    @NSManaged public func addToTaskCore(_ value: TaskCore)

    @objc(removeTaskCoreObject:)
    @NSManaged public func removeFromTaskCore(_ value: TaskCore)

    @objc(addTaskCore:)
    @NSManaged public func addToTaskCore(_ values: NSSet)

    @objc(removeTaskCore:)
    @NSManaged public func removeFromTaskCore(_ values: NSSet)

}
