//
//  SharedConstants.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 05.11.20.
//

import Foundation

struct SharedConstants {
    public static let persistenceManager = PersistenceManager.shared
    public static let context = PersistenceManager.shared.container.viewContext
    public static let userDefaultsKey = "User"
    public static let shownAchievements = ["All", "Unfinished", "Finished"]
    public static let dateFormatter = getDateFormatter()
    
    private static func getDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}
