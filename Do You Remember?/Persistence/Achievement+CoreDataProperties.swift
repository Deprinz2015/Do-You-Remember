//
//  Achievement+CoreDataProperties.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 04.11.20.
//
//

import Foundation
import CoreData


extension Achievement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }

    @NSManaged public var currentProgress: Int16
    @NSManaged public var desc: String
    @NSManaged public var maxProgresses: Array<Int>
    @NSManaged public var points: Array<Int>
    @NSManaged public var task: String
    @NSManaged public var title: String
    @NSManaged public var uuid: UUID
    @NSManaged public var progressIndex16: Int16
    @NSManaged public var completionDate: Date?
}

extension Achievement : Identifiable {

}
