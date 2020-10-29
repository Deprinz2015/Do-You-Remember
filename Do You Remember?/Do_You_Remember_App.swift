//
//  Do_You_Remember_App.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 23.10.20.
//

import SwiftUI

@main
struct Do_You_Remember_App: App {
    let context = PersistenceManager.context
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, context)
        }
    }
}
