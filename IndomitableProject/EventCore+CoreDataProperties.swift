//
//  EventCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 01/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension EventCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventCore> {
        return NSFetchRequest<EventCore>(entityName: "EventCore")
    }

    @NSManaged public var memberCount: Int64
    @NSManaged public var type: String?
    @NSManaged public var taskEvent: TaskCore?
    @NSManaged public var time: TimeCore?

}
