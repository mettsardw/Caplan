//
//  TipsCore+CoreDataProperties.swift
//  IndomitableProject
//
//  Created by Davin Reinaldo Gozali on 05/12/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//
//

import Foundation
import CoreData


extension TipsCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TipsCore> {
        return NSFetchRequest<TipsCore>(entityName: "TipsCore")
    }

    @NSManaged public var content: String?
    @NSManaged public var frequency: Int64
    @NSManaged public var event: EventCore?
    @NSManaged public var task: TaskCore?

}
