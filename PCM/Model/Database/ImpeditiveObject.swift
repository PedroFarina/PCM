//
//  ImpeditiveObject.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal struct ImpeditiveObject: PCMImpeditive {
    var category: PCMImpeditiveCategory
    var subcategory: String
    var timeSpent: TimeInterval
    var description: String {
        return category.description + " - " + subcategory + ": " + getDurationString()
    }
    var registeredAt: Date

    private func getDurationString() -> String {
        var timeRemaining = timeSpent

        let hourInSeconds: Double = 3600
        let hours = Int(timeRemaining/hourInSeconds)
        timeRemaining -= Double(hours * Int(hourInSeconds))

        let minuteInSeconds: Double = 60
        let minutes = Int(timeRemaining/minuteInSeconds)
        return "\(hours)h \(minutes)m"
    }
}
