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
        ""
    }

    var allocatedEquipment: String {
        ""
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

    init(activity: PCMActivity) {
        self.activity = activity
    }
}
