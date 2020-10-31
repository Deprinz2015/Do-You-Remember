//
//  Do_You_Remember_App.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI
import CoreData

@main
struct Do_You_Remember_App: App {
    let persistenceManager = PersistenceManager.shared
    let context = PersistenceManager.shared.container.viewContext
    
    init() {
        initSampleData()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, context)
        }
    }
    
    func initSampleData() {
        deleteExisting(for: "Achievement")
        
        let request = NSFetchRequest<Achievement>(entityName: "Achievement")
        
        let fetched = try? context.fetch(request)
        
        
        if let fetched = fetched {
            if fetched.count == 0 {
                print("Adding...")
                
                let achievementsFromJSON: [AchievementJSONWrapper] = Bundle.main.decode("initialAchievements.json")
                
                for achievement in achievementsFromJSON {
                    addAchievement(withAchievement: achievement)
                }
                
                persistenceManager.saveContext()
            }
        }
    }
    
    func addAchievement(withAchievement achievement: AchievementJSONWrapper) {
        let newAchievement = NSEntityDescription.insertNewObject(forEntityName: "Achievement", into: context)
        
        newAchievement.setValue(achievement.title, forKey: #keyPath(Achievement.title))
        newAchievement.setValue(achievement.desc, forKey: #keyPath(Achievement.desc))
        newAchievement.setValue(achievement.currentProgress, forKey: #keyPath(Achievement.currentProgress))
        newAchievement.setValue(achievement.maxProgress, forKey: #keyPath(Achievement.maxProgress))
        newAchievement.setValue(achievement.points, forKey: #keyPath(Achievement.points))
    }
    
    func deleteExisting(for entity: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try context.execute(delete)
            print("Deleting finished")
        } catch {
            print("Deleting crashed")
        }
        
    }
}
