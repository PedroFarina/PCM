//
//  ReportContainerViewModel.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation

struct ReportContainerViewModel {

    internal let activity: PCMActivity
    private var peopleWorkingCount: Int {
        activity.workingUnits.filter({ $0.category == .person }).count
    }
    private var workingEquipmentCount: Int {
        activity.workingUnits.filter { $0.category == .equipment }.count
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
        df.dateFormat = "dd/MM/yy"
        return df.string(from: activity.startedAt)
    }

    var serviceValue: String {
        String(Int(activity.serviceValue)) + " m³"
    }

    var officialWorkersCountValue: String {
        String(activity.workingUnits.filter({ $0.category == .person && $0.subcategory == .official }).count)
    }

    var nonOfficialWorkersCountValue: String {
        String(activity.workingUnits.filter({ $0.category == .person && $0.subcategory == .nonOfficial }).count)
    }

    var allocatedEquipments: String {
        return String(workingEquipmentCount)
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
