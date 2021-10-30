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
        activity.impeditives.map({ $0.timeSpent }).reduce(0, +)
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
