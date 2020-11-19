//
//  AchievementDetailView.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 26.10.20.
//

import SwiftUI
import CoreData

struct AchievementDetailView: View {
    @ObservedObject var achievement: Achievement
    @Binding var user: User
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(systemName: achievement.finished ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Text(achievement.title)
                    .font(.largeTitle)
                    .padding()
                
                Text(achievement.desc)
                    .padding()
                
                Text(achievement.task)
                    .fontWeight(.bold)
                    .padding()
                
                if !achievement.finished {
                    Text("Points: \(achievement.points[achievement.progressIndex])")
                        .padding()
                    
                    LabeledProgressView(title: "Progress",
                                        value: Float(achievement.currentProgress),
                                        max: Float(achievement.maxProgresses[achievement.progressIndex]),
                                        leftLabel: "\(achievement.currentProgress)",
                                        rightLabel: "\(achievement.maxProgresses[achievement.progressIndex])")
                        .padding()
                } else {
                    Text("Completed on: \(SharedConstants.dateFormatter.string(from: achievement.completionDate ?? Date()))")
                        .padding()
                }
                
                if !achievement.finished {
                    Button("We did it!") {
                        achievement.addProgress(amount: 1, user: &user)
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
            }
            .onDisappear(perform: {
                let context = PersistenceManager.shared.container.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Achievement")
                fetchRequest.predicate = NSPredicate(format: "uuid = %@", achievement.uuid as CVarArg)
                do {
                    let results = try context.fetch(fetchRequest) as? [NSManagedObject]
                    if let result = results?[0] {
                        result.setValue(achievement.currentProgress, forKey: #keyPath(Achievement.currentProgress))
                    }
                } catch {
                    print("Fetch Failed: \(error)")
                }
                PersistenceManager.shared.saveContext()
            })
        }
    }
}

struct AchievementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementDetailView(achievement: Achievement(), user: .constant(User())).preferredColorScheme(.dark)
    }
}
