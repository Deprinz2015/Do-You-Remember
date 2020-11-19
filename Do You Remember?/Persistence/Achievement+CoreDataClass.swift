//
//  Achievement+CoreDataClass.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 29.10.20.
//
//

import Foundation
import CoreData

@objc(Achievement)
public class Achievement: NSManagedObject {
    public typealias Sorter = (Achievement, Achievement) -> Bool
    
    @nonobjc public class func getFinishedAchievements(sortedBy sorter: Sorter? = nil) -> [Achievement] {
        let request: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        let fetchedResults = try? PersistenceManager.shared.container.viewContext.fetch(request)
        
        guard let results = fetchedResults else {
            return []
        }
        return results
            .filter{$0.finished}
            .sorted(by: sorter ?? {(a1, a2) -> Bool in true })
    }
    
    @nonobjc public class func getUnfinishedAchievements(sortedBy sorter: Sorter? = nil) -> [Achievement] {
        let request: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        let fetchedResults = try? PersistenceManager.shared.container.viewContext.fetch(request)
        
        guard let results = fetchedResults else {
            return []
        }
        return results
            .filter{!$0.finished}
            .sorted(by: sorter ?? {(a1, a2) -> Bool in true })
    }
    
    @nonobjc public class func getAllAchievements(sortedBy sorter: Sorter? = nil) -> [Achievement] {
        let request: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        let results = try? PersistenceManager.shared.container.viewContext.fetch(request)
        return results?.sorted(by: sorter ?? {(a1, a2) -> Bool in true }) ?? []
    }
}
