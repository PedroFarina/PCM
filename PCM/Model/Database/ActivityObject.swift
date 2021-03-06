//
//  ActivityObject.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal class ActivityObject: PCMActivity {

    internal init(name: String, description: String, state: PCMActivityState, serviceValue: Double, startedAt: Date,
                  timeElapsed: TimeInterval, workingUnits: [PCMWorkingUnit], impeditives: [PCMImpeditive], comments: [CommentObject]) {
        self.name = name
        self.description = description
        self.state = state
        self.serviceValue = serviceValue
        self.startedAt = startedAt
        self.timeElapsed = timeElapsed
        self.workingUnits = workingUnits
        self.impeditives = impeditives
        self.comments = comments
    }

    let name: String
    let description: String
    var state: PCMActivityState
    let serviceValue: Double
    let startedAt: Date
    var timeElapsed: TimeInterval
    var workingUnits: [PCMWorkingUnit]
    var impeditives: [PCMImpeditive]
    var comments: [CommentObject]
    var logItems: [PCMActivityLogItem] {
        var activities: [PCMActivityLogItem] = []
        activities.append(contentsOf: comments)
        activities.append(contentsOf: impeditives)
        activities.sort(by: { $0.registeredAt < $1.registeredAt })
        return activities
    }

    func calculateEfficiency() -> Double {
        let peopleCount = Double(workingUnits.filter({ $0.category == .person }).count)
        let allHours = peopleCount * timeElapsed
        let unproductiveIndividualHours = impeditives.filter({ !$0.category.appliesToAll }).map({ $0.timeSpent }).reduce(0, +)
        let unproductiveGroupedHours = impeditives.filter({ $0.category.appliesToAll }).map({ $0.timeSpent * peopleCount }).reduce(0, +)
        let unproductiveHours = unproductiveIndividualHours + unproductiveGroupedHours
        let usefulHours = (allHours - unproductiveHours)/3600

        return peopleCount * usefulHours / serviceValue
    }

    func getTimeElapsedString() -> String {
        return timeElapsed.getTimeElapsedString()
    }

    func addWorkingUnit(_ workingUnit: PCMWorkingUnit, at date: Date = Date()) {
        workingUnits.append(workingUnit)
        var comment = ModelController.createComment(with: "\(workingUnit.description) foi adicionado a tarefa.")
        comment.registeredAt = date
        comments.append(comment)
    }

    func removeWorkingUnit(_ workingUnit: PCMWorkingUnit) {
        if let index = workingUnits.firstIndex(where: { $0.description == workingUnit.description }) {
            workingUnits.remove(at: index)
            let comment = ModelController.createComment(with: "\(workingUnit.description) foi removido da tarefa.")
            comments.append(comment)
        }
    }

    private func removeWorkingUnit(at index: Int) {
        let workingUnit = workingUnits.remove(at: index)
        let comment = ModelController.createComment(with: "\(workingUnit.description) foi removido da tarefa.")
        comments.append(comment)
    }

    func qrCodeFoundWorkingUnit(_ workingUnit: PCMWorkingUnit) {
        if let array = workingUnits as? [WorkingUnitObject], let object = workingUnit as? WorkingUnitObject {
            if let index = array.firstIndex(of: object) {
                removeWorkingUnit(at: index)
            } else {
                addWorkingUnit(workingUnit)
            }
        }
    }
}
