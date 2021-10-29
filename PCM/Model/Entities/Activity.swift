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

internal protocol PCMActivity: AnyObject {
    var name: String { get }
    var description: String { get }
    var state: PCMActivityState { get }
    var serviceValue: Double { get }
    var startedAt: Date { get }
    var timeElapsed: TimeInterval { get set }

    var workingUnits: [PCMWorkingUnit] { get }
    var impeditives: [PCMImpeditive] { get set }
    var comments: [CommentObject] { get set }
    var logItems: [PCMActivityLogItem] { get }

    func calculateEfficiency() -> Double
    func getTimeElapsedString() -> String

    func addWorkingUnit(_ workingUnit: PCMWorkingUnit, at date: Date)
    func removeWorkingUnit(_ workingUnit: PCMWorkingUnit)
}
