//
//  CovidEntity+CoreDataProperties.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 07/11/2022.
//
//

import Foundation
import CoreData


extension CovidEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CovidEntity> {
        return NSFetchRequest<CovidEntity>(entityName: "CovidEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64

}

extension CovidEntity : Identifiable {

}
