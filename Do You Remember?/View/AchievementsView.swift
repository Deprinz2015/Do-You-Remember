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
                Text(achievement.title).font(.headline)
                Text(achievement.finished ?
                        "Completed!" :
                        "Progress: \(achievement.currentProgress) / \(achievement.maxProgresses[achievement.progressIndex])")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct AchievementsView: View {
    @ObservedObject private var vm: AchievementViewModel
    
    init(user: User) {
        self.vm = AchievementViewModel(user: user)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Which Achievements to show?", selection: $vm.selection) {
                    ForEach(AchievementViewModel.FilteredBy.allCases) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.leading)
                .padding(.trailing)
                
                Section {
                    List {
                        ForEach(vm.achievements) { achievement in
                            NavigationLink(
                                destination: AchievementDetailView(achievement: achievement, user: $vm.user),
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
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(user: User()).preferredColorScheme(.dark)
    }
}
