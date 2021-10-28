//
//  ActivityObject.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal struct ActivityObject: PCMActivity {
    var name: String
    var description: String
    var state: PCMActivityState
    var serviceValue: Double
    var startedAt: Date
    var timeElapsed: TimeInterval
    var workingUnits: [PCMWorkingUnit]
    var impeditives: [PCMImpeditive]
    var comments: [CommentObject]
    var logItems: [PCMActivityLogItem] {
        var activities: [PCMActivityLogItem] = []
        activities.append(contentsOf: comments)
        activities.append(contentsOf: impeditives)
        activities.sort(by: { $0.registeredAt < $1.registeredAt })
        return activities
    }

    func calculateEfficiency() -> Double {
        return 0
    }

    func getTimeElapsedString() -> String {
        var timeRemaining = timeElapsed

        let dayInSeconds: Double = 86400
        let days = Int(timeRemaining/dayInSeconds)
        timeRemaining -= Double(days * Int(dayInSeconds))

        let hourInSeconds: Double = 3600
        let hours = Int(timeRemaining/hourInSeconds)
        timeRemaining -= Double(hours * Int(hourInSeconds))

        let minuteInSeconds: Double = 60
        let minutes = Int(timeRemaining/minuteInSeconds)
        return "\(days)d \(hours)h \(minutes)m"
    }

    mutating func addWorkingUnit(_ workingUnit: PCMWorkingUnit) {
        self.workingUnits.append(workingUnit)
    }
    mutating func addComment(_ comment: CommentObject) {
        self.comments.append(comment)
    }
    mutating func addImpeditive(_ impeditive: PCMImpeditive) {
        self.impeditives.append(impeditive)
    }
}
