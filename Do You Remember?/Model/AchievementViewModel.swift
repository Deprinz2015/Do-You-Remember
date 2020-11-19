//
//  AchievementViewModel.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 09.11.20.
//

import Foundation
import Combine

class AchievementViewModel: ObservableObject {
    @Published var user: User
    @Published var selection = FilteredBy.unfinished
    @Published var achievements: [Achievement] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var sorter = { (a1: Achievement, a2: Achievement) -> Bool in
        if a1.progressPercentage != a2.progressPercentage {
            return a1.progressPercentage > a2.progressPercentage
        }
        else if a1.progressIndex < a1.maxProgresses.count && a2.progressIndex < a2.maxProgresses.count {
            return a1.maxProgresses[a1.progressIndex] < a2.maxProgresses[a2.progressIndex]
        }
        else {
            return a1.totalProgress > a2.totalProgress
        }
    }
    
    enum FilteredBy: String, CaseIterable, Identifiable {
        var id: String {self.rawValue}
        
        case all
        case unfinished
        case finished
    }
    
    init(user: User) {
        self.user = user
        
        getFilteredAchievementPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.achievements, on: self)
            .store(in: &cancellableSet)
    }
    
    private var getFilteredAchievementPublisher: AnyPublisher<[Achievement], Never> {
        $selection
            .map { [self] in
                switch $0 {
                    case .finished:
                        return Achievement.getFinishedAchievements(sortedBy: sorter)
                    case .unfinished:
                        return Achievement.getUnfinishedAchievements(sortedBy: sorter)
                    case .all:
                        return Achievement.getAllAchievements(sortedBy: sorter)
                }
            }
            .eraseToAnyPublisher()
    }
}
