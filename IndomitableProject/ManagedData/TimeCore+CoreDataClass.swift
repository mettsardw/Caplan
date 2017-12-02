//
//  TimeCore+CoreDataClass.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 30/11/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TimeCore)
public class TimeCore: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeCore> {
        return NSFetchRequest<TimeCore>(entityName: "TimeCore")
    }
    
    @NSManaged public var duration: Int64
    @NSManaged public var unit: String?
    @NSManaged public var taskTime: TaskCore?
}
