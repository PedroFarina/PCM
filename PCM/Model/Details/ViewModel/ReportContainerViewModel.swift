//
//  ReportContainerViewModel.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation

struct ReportContainerViewModel {

    private let activity: PCMActivity

    var workersTimeValue: String {
        "1"
    }

    var allocatedEquipments: String {
        let equipments: Int = activity.workingUnits.filter { $0.category == .equipment }.count

        return String(equipments)
    }

    var workedHours: String {
        "12"
    }

    var productiveHours: String {
        "123"
    }

    var unproductiveHours: String {
        "1234"
    }

    init(activity: PCMActivity) {
        self.activity = activity
    }
}
