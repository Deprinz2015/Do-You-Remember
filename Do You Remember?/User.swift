//
//  User.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import Foundation

struct User: Codable {
    var level: Int
    var progress: Int {
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
    
    var beginDate: Date
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: beginDate)
    }
    
    var homeTitle = "My Love"
    var imageName = "couple"
}
