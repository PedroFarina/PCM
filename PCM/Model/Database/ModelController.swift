//
//  ModelController.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal final class ModelController {
    private init() {
    }

    private static func generateDate() -> Date {
        let date = Date()
        return date.addingTimeInterval(Double.random(in: -3600...3600))
    }

    private static let categories: [PCMImpeditiveCategory] = [EquipmentCategory(), WorkerCategory(), MaterialCategory(), NatureCategory()]

    internal static func getMockedActivities() -> [PCMActivity] {
        let objects = [
            ActivityObject(name: "Escavação - TQ1004",
                           description: "Escavação - TQ1004",
                           state: .todo,
                           serviceValue: 5,
                           startedAt: generateDate(),
                           timeElapsed: 0,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Contenção praça de bombas",
                           description: "Contenção praça de bombas",
                           state: .todo,
                           serviceValue: 5,
                           startedAt: generateDate(),
                           timeElapsed: 0,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Escavação - TQ1002",
                           description: "Escavação - TQ1002",
                           state: .doing,
                           serviceValue: 7,
                           startedAt: generateDate(),
                           timeElapsed: 15783,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Escavação - TQ1003",
                           description: "Escavação - TQ1003",
                           state: .doing,
                           serviceValue: 7,
                           startedAt: generateDate(),
                           timeElapsed: 8430,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Terraplenagem geral",
                           description: "Terraplenagem geral",
                           state: .doing,
                           serviceValue: 5,
                           startedAt: generateDate(),
                           timeElapsed: 14400,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Escavação - TQ1001",
                           description: "Escavação - TQ1001",
                           state: .done,
                           serviceValue: 45,
                           startedAt: generateDate(),
                           timeElapsed: 12454,
                           workingUnits: [], impeditives: [], comments: [])
        ]
        for i in 2 ..< objects.count {
            let category: WorkingUnitCategory
            if i == 4 {
                category = .equipment
            } else {
                category = .person
            }
            for workingUnit in generateWorkingUnits(category) {
                objects[i].addWorkingUnit(workingUnit)
            }
        }
        return objects
    }

    private static let name: String = "Servente"
    private static let equipments: [String] = [
        "Pá carregadeira",
        "Rolo compactador"
    ]
    private static func generateWorkingUnits(_ category: WorkingUnitCategory) -> [WorkingUnitObject] {
        if category == .person {
            let subcategory: WorkingUnitSubcategory = .official
            let workingUnitObject = WorkingUnitObject(category: category, subcategory: subcategory, title: "Funcionario", description: name)
            return [workingUnitObject]
        } else {
            let subcategory: WorkingUnitSubcategory = .none
            var workingUnits: [WorkingUnitObject] = []
            for equipment in equipments {
                workingUnits.append(WorkingUnitObject(category: category, subcategory: subcategory, title: "Empresa", description: equipment))
            }
            return workingUnits
        }
    }

    internal static func getImpeditiveCategories() -> [PCMImpeditiveCategory] {
        return []
    }
    internal static func createWorkingUnit(description: String, category: WorkingUnitCategory, subcategory: WorkingUnitSubcategory, title: String ) -> PCMWorkingUnit {
        WorkingUnitObject(category: category, subcategory: subcategory, title: title, description: description)
    }
    internal static func createComment(with description: String) -> CommentObject {
        CommentObject(description: description, registeredAt: Date())
    }
    internal static func createImpeditive(with category: PCMImpeditiveCategory, and subcategory: String, for time: TimeInterval) -> PCMImpeditive {
        ImpeditiveObject(category: category, subcategory: subcategory, timeSpent: time, registeredAt: Date())
    }

}
