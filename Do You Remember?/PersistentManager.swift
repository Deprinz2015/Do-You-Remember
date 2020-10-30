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
