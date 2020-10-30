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
        initialData()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, context)
        }
    }
    
    func initialData() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Achievement")
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try context.execute(delete)
            print("deleted")
        } catch {
            print("Lol")
        }
        
        let fetched = try? context.fetch(request)
        
        if let fetched = fetched {
            print(fetched.count)
            
            if fetched.count == 0 {
                print("Adding...")
                
                let sampleDesc = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                
                for i in 1...20 {
                    let newAchievement = NSEntityDescription.insertNewObject(forEntityName: "Achievement", into: context)
                    newAchievement.setValue("Achievement \(i)", forKey: "title")
                    newAchievement.setValue(sampleDesc, forKey: "desc")
                    newAchievement.setValue(200.0, forKey: "maxProgress")
                    newAchievement.setValue(Float(i * 10), forKey: "currentProgress")
                    newAchievement.setValue(200, forKey: "points")
                    context.insert(newAchievement)
                }
                persistenceManager.saveContext()
            }
            print(fetched.count)
        }
    }
}
