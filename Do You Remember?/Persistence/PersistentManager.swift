//
//  PersistentController.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 29.10.20.
//

import SwiftUI
import CoreData

class PersistenceManager {
    public static let shared = PersistenceManager()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func addAchievement(withWrapper wrapper: AchievementJSONWrapper) {
        addAchievement(title: wrapper.title,
                       desc: wrapper.desc,
                       task: wrapper.task,
                       maxProgresses: wrapper.maxProgresses,
                       points: wrapper.points)
    }
    
    func addAchievement(title: String, desc: String, task: String, maxProgresses: [Int], points: [Int]) {
        let newAchievement = NSEntityDescription.insertNewObject(forEntityName: "Achievement", into: container.viewContext)
        
        newAchievement.setValue(UUID(), forKey: #keyPath(Achievement.uuid))
        newAchievement.setValue(title, forKey: #keyPath(Achievement.title))
        newAchievement.setValue(desc, forKey: #keyPath(Achievement.desc))
        newAchievement.setValue(task, forKey: #keyPath(Achievement.task))
        newAchievement.setValue(points, forKey: #keyPath(Achievement.points))
        newAchievement.setValue(maxProgresses, forKey: #keyPath(Achievement.maxProgresses))
        newAchievement.setValue(0, forKey: #keyPath(Achievement.progressIndex16))
        newAchievement.setValue(0, forKey: #keyPath(Achievement.currentProgress))
        newAchievement.setValue(nil, forKey: #keyPath(Achievement.completionDate))
    }
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
