//
//  Achievement+CoreDataProperties.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 29.10.20.
//
//

import Foundation
import CoreData


extension Achievement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var maxProgress: Float
    @NSManaged public var currentProgress: Float
    @NSManaged public var points: Int16
    public var finished: Bool {
        currentProgress == maxProgress
    }

}

extension Achievement : Identifiable {

}
