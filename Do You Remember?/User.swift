//
//  User.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import Foundation

struct User: Codable {
    var level = 1
    var progress = 0 {
        didSet {
            if progress >= progressForNextLevel {
                level += 1
            }
        }
    }
    var progressForLastLevel: Int {
        let lastLevel = level - 1
        return 1000 * lastLevel + 200 * lastLevel * lastLevel
    }
    var progressForNextLevel: Int {
        1000 * level + 200 * level * level
    }
    
    var beginDate = Date()
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: beginDate)
    }
    
    var homeTitle = "My Love"
    var imageName = "couple"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "User") {
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
}
