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
    var logItems: [PCMActivityLogItem]

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
}
