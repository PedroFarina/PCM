//
//  ReportContainerViewModel.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation

struct ReportContainerViewModel {

    private let activity: PCMActivity

    var workersTimeValue: String

    var allocatedEquipments: String {
        let equipments: Int = activity.workingUnits.filter { $0.category == .equipment }.count

        return String(equipments)
    }

    var workedHours: String {
        ""
    }

    var productiveHours: String {
        ""
    }

    var unproductiveHours: String {
        ""
    }

    init(activity: PCMActivity, workersTimeValue: String) {
        self.activity = activity
        self.workersTimeValue = workersTimeValue
    }
}
