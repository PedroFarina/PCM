//
//  TimeInterval Extension.swift
//  PCM
//
//  Created by Pedro Farina on 29/10/21.
//

import Foundation

extension TimeInterval {
    func getTimeElapsedString() -> String {
        var timeRemaining = self

        let dayInSeconds: Double = 86400
        let days = Int(timeRemaining/dayInSeconds)
        timeRemaining -= Double(days * Int(dayInSeconds))
        let daysString = "\(days)d"

        let hourInSeconds: Double = 3600
        let hours = Int(timeRemaining/hourInSeconds)
        timeRemaining -= Double(hours * Int(hourInSeconds))
        let hoursString = "\(hours)h"

        let minuteInSeconds: Double = 60
        let minutes = Int(timeRemaining/minuteInSeconds)
        timeRemaining -= Double(minutes * Int(minuteInSeconds))
        let minutesString = "\(minutes)m\(Int(timeRemaining))s"

        if days > 0 {
            return daysString + hoursString + minutesString
        }
        if hours > 0 {
            return hoursString + minutesString
        }
        if minutes > 0 {
            return minutesString
        }
        return "0d0h0m"
    }

}
