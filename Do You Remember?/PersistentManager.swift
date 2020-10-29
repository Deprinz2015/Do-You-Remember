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
        
        let context = container.viewContext
        context.reset()
        
        if (try? context.fetch(NSFetchRequest(entityName: "Achievement")))?.count == 0 {
            for i in 0...1 {
                let ach = Achievement(context: context)
                ach.title = "Achievement \(i)"
                ach.desc = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                ach.maxProgress = 200.0
                ach.currentProgress = Float(i) * 10.0
                ach.points = 200
                
                print(i)
                
                try? context.save()
            }
        }
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
