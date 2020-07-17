//
//  Recode+CoreDataProperties.swift
//  
//
//  Created by Junhyeon on 2020/07/15.
//
//

import Foundation
import CoreData


extension Recode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recode> {
        return NSFetchRequest<Recode>(entityName: "Recode")
    }

    @NSManaged public var recode: String?
    @NSManaged public var time: Date?

}
