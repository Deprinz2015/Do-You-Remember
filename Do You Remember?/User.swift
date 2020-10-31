//
//  User.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import Foundation

struct User: Codable {
    static let userDefaultsKey = "User"
    
    // Declared Properties
    var level = 1
    var progress = 0 {
        didSet {
            if progress >= progressForNextLevel {
                level += 1
            }
            
            saveToDisk()
        }
    }
    var beginDate = Date() {
        didSet { saveToDisk() }
    }
    var homeTitle = "" {
        didSet { saveToDisk() }
    }
    var imageName = "couple" {
        didSet { saveToDisk() }
    }
    
    // Computed Properties
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: beginDate)
    }
    var progressForLastLevel: Int {
        let lastLevel = level - 1
        return 1000 * lastLevel + 200 * lastLevel * lastLevel
    }
    var progressForNextLevel: Int {
        1000 * level + 200 * level * level
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: User.userDefaultsKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(User.self, from: data) {
                self.level = decoded.level
                self.progress = decoded.progress
                self.beginDate = decoded.beginDate
                self.homeTitle = decoded.homeTitle
                self.imageName = decoded.imageName
                return
            }
        }
    }
    
    // Functions
    func saveToDisk() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self) {
            UserDefaults.standard.setValue(data, forKey: User.userDefaultsKey)
        }
    }
}
