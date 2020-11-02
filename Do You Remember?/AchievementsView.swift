//
//  AchievementsView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 26.10.20.
//

import SwiftUI

struct AchievementItem: View {
    @ObservedObject var achievement: Achievement
    
    var body: some View {
        HStack {
            Image(systemName: achievement.finished ? "star.fill" : "star")
                .resizable()
                .frame(width: 25, height: 25)
            VStack(alignment: .leading) {
                Text(achievement.title ?? "Achievement").font(.headline)
                Text("Progress: \(achievement.currentProgress) / \(achievement.maxProgress)")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct AchievementsView: View {
    @Binding var user: User
    
    let showAchievements = ["All", "Unfinished", "Finished"]
    @State private var selection = 1
    
    @FetchRequest(
        entity: Achievement.entity(),
        sortDescriptors: [])
    var achievements: FetchedResults<Achievement>
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Which Achievements to show?", selection: $selection) {
                    ForEach(0 ..< self.showAchievements.count) {
                        Text(showAchievements[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.leading)
                .padding(.trailing)
                
                Section {
                    List {
                        ForEach(achievements.filter(showAchievement)) { achievement in
                            NavigationLink(
                                destination: AchievementDetailView(achievement: achievement, user: $user),
                                label: {
                                    AchievementItem(achievement: achievement)
                                })
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Achievements")
        }
    }
    
    func showAchievement(achievement: Achievement) -> Bool {
        switch selection {
            case 0:
                return true
            case 1:
                return achievement.finished == false
            case 2:
                return achievement.finished
            default:
                return false
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(user: .constant(User())).preferredColorScheme(.dark)
    }
}
