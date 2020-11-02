//
//  AchievementJSONWrapper.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 31.10.20.
//

import Foundation

struct AchievementJSONWrapper: Decodable {
    var title: String
    var desc: String
    var task: String
    var currentProgress: Int
    var maxProgress: Int
    var points: Int
}
