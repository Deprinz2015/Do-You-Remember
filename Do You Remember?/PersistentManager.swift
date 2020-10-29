//
//  PersistentController.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 29.10.20.
//

import SwiftUI
import CoreData

class PersistenceManager {
    private init() {}
    
    public static var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    public static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                fatalError("unresolved Error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
    
    public static func saveContext () {
        let context = persistentContainer.viewContext
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
