//
//  Activity.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal enum PCMActivityState {
    case todo
    case doing
    case done
}

internal protocol PCMActivity {
    var name: String { get }
    var description: String { get }
    var state: PCMActivityState { get }
    var serviceValue: Double { get }
    var startedAt: Date { get }

    var workingUnits: [PCMWorkingUnit] { get }
    var impeditives: [PCMImpeditive] { get }
    var logItems: [PCMActivityLogItem] { get }

    func calculateEfficiency() -> Double
}
