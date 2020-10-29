//
//  AchievementDetailView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 26.10.20.
//

import SwiftUI

struct AchievementDetailView: View {
    var achievement: Achievement
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Image(systemName: achievement.finished ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    Text(achievement.title)
                        .font(.largeTitle)
                        .padding()
                    
                    Text(achievement.description)
                        .padding()
                    
                    VStack {
                        ProgressView("Progress", value: achievement.currentProgress, total: achievement.maxProgress)
                        HStack {
                            Text("\(achievement.currentProgress, specifier: "%g")")
                            Spacer()
                            Text("\(achievement.maxProgress, specifier: "%g")")
                        }
                    }
                    .padding()
                    
                    Text("Points: \(achievement.points)")
                        .padding()
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct AchievementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementDetailView(achievement: Achievement()).preferredColorScheme(.dark)
    }
}
