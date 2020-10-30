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
                var achievementsToAdd = [Achievement]()
                
                for i in 1...20 {
                    let ach = Achievement(context: context)
                    ach.title = "Achievement \(i)"
                    ach.desc = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                    ach.maxProgress = 200.0
                    ach.currentProgress = Float(i * 10)
                    ach.points = 200
                    achievementsToAdd.append(ach)
                }
                try? context.save()
            }
            print(fetched.count)
        }
    }
}
