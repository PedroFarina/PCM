//
//  Calendar Extension.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

extension Calendar {
    func calculateComponentBetween(_ from: Date, and to: Date, with component: Calendar.Component) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([component], from: fromDate, to: toDate)

        return numberOfDays.day!
    }
}
