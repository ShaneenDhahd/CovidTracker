//
//  CovidRecord+CoreDataProperties.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 06/11/2022.
//
//

import Foundation
import CoreData


extension CovidRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CovidRecord> {
        return NSFetchRequest<CovidRecord>(entityName: "CovidRecord")
    }

    @NSManaged public var date: Int64
    @NSManaged public var state: Int64
    @NSManaged public var positive: Int64
    @NSManaged public var negative: Int64
    @NSManaged public var attribute: Int64
    @NSManaged public var death: Int64
    @NSManaged public var totalTestResults: Int64
    @NSManaged public var total: Int64
    @NSManaged public var posNeg: Int64
    @NSManaged public var deathIncrease: Int64
    @NSManaged public var hospitalizedIncrease: Int64
    @NSManaged public var negativeIncrease: Int64
    @NSManaged public var positiveIncrease: Int64
    @NSManaged public var totalTestResultsIncrease: Int64

}

extension CovidRecord : Identifiable {

}
