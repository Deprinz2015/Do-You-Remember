//
//  StatisticsView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 02.11.20.
//

import SwiftUI

struct StatisticsView: View {
    var user: User
    var days: Int {
        Calendar.current.daysSince(date: user.beginDate) ?? 0
    }
    var weeks: Int {
        (Calendar.current.daysSince(date: user.beginDate) ?? 0) / 7
    }
    var months: Int {
        Calendar.current.monthsSince(date: user.beginDate) ?? 0
    }
    var years: Int {
        Calendar.current.yearsSince(date: user.beginDate) ?? 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Text("Together since: \(user.formattedDate)")
                    .font(.headline)
                
                Section {
                    Text("Level: \(user.level)")
                    Text("Finished Achievements: \(Achievement.getFinishedAchievements().count)")
                    Text("Total Points: \(user.progress)")
                }
                
                Section(header: Text("Together for")) {
                    Section {
                        Text("\(days) day\(days == 1 ? "" : "s")")
                        Text("\(weeks) week\(weeks == 1 ? "" : "s")")
                        Text("\(months) month\(months == 1 ? "" : "s")")
                        Text("\(years) year\(years == 1 ? "" : "s")")
                    }
                }
            }
            .navigationTitle("Statistics")
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(user: User())
    }
}

extension Calendar {
    public func daysSince(date: Date) -> Int? {
        return self.dateComponents([.day], from: date, to: Date()).day
    }
    public func monthsSince(date: Date) -> Int? {
        return self.dateComponents([.month], from: date, to: Date()).month
    }
    public func yearsSince(date: Date) -> Int? {
        return self.dateComponents([.year], from: date, to: Date()).year
    }
}
