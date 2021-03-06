//
//  EventCore+CoreDataClass.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData

@objc(EventCore)
public class EventCore: NSManagedObject {

}

extension EventCore {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventCore> {
        return NSFetchRequest<EventCore>(entityName: "EventCore")
    }
    
    @NSManaged public var memberCount: Int64
    @NSManaged public var type: String?
    @NSManaged public var taskEvent: TaskCore?
    @NSManaged public var time: TimeCore?
    
}

