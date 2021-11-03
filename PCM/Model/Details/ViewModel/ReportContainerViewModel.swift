//
//  ReportContainerViewModel.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation

struct ReportContainerViewModel {

    private let activity: PCMActivity
    private var peopleWorkingCount: Int {
        activity.workingUnits.filter({ $0.category == .person }).count
    }
    private var allHours: TimeInterval {
        Double(peopleWorkingCount) * activity.timeElapsed
    }
    private var unproductiveTimeCount: TimeInterval {
        let impeditives = activity.impeditives
        let unproductiveIndividualHours = impeditives.filter({ !$0.category.appliesToAll }).map({ $0.timeSpent }).reduce(0, +)
        let unproductiveGroupedHours = impeditives.filter({ $0.category.appliesToAll }).map({ $0.timeSpent * Double(peopleWorkingCount) }).reduce(0, +)
        return unproductiveIndividualHours + unproductiveGroupedHours
    }

    var startDate: String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM"
        return df.string(from: activity.startedAt)
    }

    var serviceValue: String {
        String(Int(activity.serviceValue))
    }

    var workersTimeValue: String {
        String(peopleWorkingCount)
    }

    var allocatedEquipments: String {
        let equipments: Int = activity.workingUnits.filter { $0.category == .equipment }.count
        return String(equipments)
    }

    var workedHours: String {
        String(allHours.getTimeElapsedString())
    }

    var productiveHours: String {
        String((allHours - unproductiveTimeCount).getTimeElapsedString())
    }

    var unproductiveHours: String {
        String(unproductiveTimeCount.getTimeElapsedString())
    }

    var efficiency: String {
        String(format: "%.2f", activity.calculateEfficiency())
    }

    init(activity: PCMActivity) {
        self.activity = activity
    }
}
