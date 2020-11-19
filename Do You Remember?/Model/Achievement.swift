//
//  Achievement.swift
//  Do You Remember?
//
//  Created by Niklas Koll on 09.11.20.
//

import Foundation

extension Achievement {
    
    var finished: Bool {
        progressIndex == maxProgresses.count
    }
    
    var missingProgress: Int {
        if !finished {
            return maxProgresses[progressIndex] - Int(currentProgress)
        } else {
            return 0
        }
    }
    
    var progressPercentage: Float {
        if progressIndex >= maxProgresses.count { return 100 }
        else { return Float(currentProgress) / Float(maxProgresses[progressIndex]) }
    }
    
    var progressIndex: Int {
        get { Int(self.progressIndex16) }
        set { self.progressIndex16 = Int16(newValue) }
    }
    
    var totalProgress: Int {
        var total = 0
        for i in maxProgresses {
            total += i
        }
        return total
    }
    
    func addProgress(amount: Int, user: inout User) {
        if amount < 1 { return }
        
        for _ in 1...amount {
            currentProgress += 1
            if currentProgress == maxProgresses[progressIndex] {
                user.progress += points[progressIndex]
                currentProgress = 0
                progressIndex += 1
            }
            
            if finished {
                completionDate = Date()
            }
        }
    }
    
    
}
