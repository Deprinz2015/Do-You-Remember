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
    
    func addAchievement(withWrapper achievement: AchievementJSONWrapper) {
        addAchievement(title: achievement.title,
                       desc: achievement.desc,
                       task: achievement.task,
                       currentProgress: achievement.currentProgress,
                       maxProgress: achievement.maxProgress,
                       points: achievement.points)
    }
    
    func addAchievement(title: String, desc: String, task: String, currentProgress: Int, maxProgress: Int, points: Int) {
        let newAchievement = NSEntityDescription.insertNewObject(forEntityName: "Achievement", into: container.viewContext)
        
        newAchievement.setValue(title, forKey: #keyPath(Achievement.title))
        newAchievement.setValue(desc, forKey: #keyPath(Achievement.desc))
        newAchievement.setValue(currentProgress, forKey: #keyPath(Achievement.currentProgress))
        newAchievement.setValue(maxProgress, forKey: #keyPath(Achievement.maxProgress))
        newAchievement.setValue(points, forKey: #keyPath(Achievement.points))
        newAchievement.setValue(task, forKey: #keyPath(Achievement.task))
        newAchievement.setValue(UUID(), forKey: #keyPath(Achievement.uuid))
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
