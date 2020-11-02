//
//  Achievement+CoreDataProperties.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 29.10.20.
//
//

import Foundation
import CoreData


extension Achievement: Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var task: String?
    @NSManaged public var maxProgress: Int16
    @NSManaged public var currentProgress: Int16
    @NSManaged public var points: Int16
    public var finished: Bool {
        currentProgress == maxProgress
    }
    public var missingProgress: Int16 {
        maxProgress - currentProgress
    }
    

}
