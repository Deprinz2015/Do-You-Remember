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
    
    
    init() {
        let reset = UserDefaults.standard.bool(forKey: "ResetAchievements")
        if reset {
            deleteExisting(for: "Achievement")
            initSampleData()
            UserDefaults.standard.setValue(false, forKey: "ResetAchievements")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, SharedConstants.context)
        }
    }
    
    func initSampleData() {
        let context = SharedConstants.context
        let persistenceManager = SharedConstants.persistenceManager
        
        
        
        let request: NSFetchRequest<Achievement> = Achievement.fetchRequest()
        
        let fetched = try? context.fetch(request)
        
        
        if let fetched = fetched {
            if fetched.count == 0 {
                print("Adding...")
                
                let achievementsFromJSON: [AchievementJSONWrapper] = Bundle.main.decode("initialAchievements.json")
                
                for achievement in achievementsFromJSON {
                    persistenceManager.addAchievement(withWrapper: achievement)
                }
                
                persistenceManager.saveContext()
            }
        }
    }
    
    func deleteExisting(for entity: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try SharedConstants.context.execute(delete)
            print("Deleting finished")
        } catch {
            print("Deleting crashed")
        }
        
    }
}
