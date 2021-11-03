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
                           workingUnits: [], impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Escavação - TQ1003",
                           description: "Escavação - TQ1003",
                           state: .doing,
                           serviceValue: 7,
                           startedAt: generateDate(),
                           timeElapsed: 8430,
                           workingUnits: [], impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Terraplenagem geral",
                           description: "Terraplenagem geral",
                           state: .doing,
                           serviceValue: 5,
                           startedAt: generateDate(),
                           timeElapsed: 14400,
                           workingUnits: [], impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Escavação - TQ1001",
                           description: "Escavação - TQ1001",
                           state: .done,
                           serviceValue: 45,
                           startedAt: generateDate(),
                           timeElapsed: 12454,
                           workingUnits: [], impeditives: generateImpeditives(), comments: generateComments())
        ]
        for object in objects {
            if object.state != .todo {
                let workingUnits = generateWorkingUnits()
                for unit in workingUnits {
                    object.addWorkingUnit(unit)
                }
                object.removeWorkingUnit(workingUnits[0])
            }
        }
        return objects
    }

    private static let names: [String] = [
        "Carpinteiro",
        "Marcineiro",
        "Pedreiro",
        "Servente"
    ]
    private static let equipments: [String] = [
        "Broca",
        "Caminhão",
        "Escavadeira"
    ]
    private static func generateWorkingUnits() -> [WorkingUnitObject] {
        var workingUnitObjects: [WorkingUnitObject] = []
        for _ in 0 ... Int.random(in: 1 ... 15) {
            let randomizer = Int.random(in: 0...100)
            let category: WorkingUnitCategory = randomizer % 2 == 1 ? .person: .equipment
            let desc = category == .person ? names.randomElement()! : equipments.randomElement()!
            let subcategory: WorkingUnitSubcategory = Int.random(in: 0...100) % 2 == 1 ? .official: .nonOfficial
            let workingUnitObject = WorkingUnitObject(category: category, subcategory: subcategory, title: "", description: desc)
            workingUnitObjects.append(workingUnitObject)
        }
        return workingUnitObjects
    }
    private static func generateImpeditives() -> [ImpeditiveObject] {
        var impeditiveObjects: [ImpeditiveObject] = []
        for _ in 0 ... Int.random(in: 1 ... 2) {
            let category = categories.randomElement()!
            let subCategory = category.subcategories.randomElement()!
            impeditiveObjects.append(ImpeditiveObject(category: category,
                                                      subcategory: subCategory,
                                                      timeSpent: .random(in: 0 ... 6000),
                                                      registeredAt: generateDate()))
        }
        return impeditiveObjects
    }

    private static let comments: [String] = [
        "Hoje o dia foi muito quente",
        "João estava com muito sono",
        "O dia esfriou de repente"
    ]
    private static func generateComments() -> [CommentObject] {
        var commentObjects: [CommentObject] = []
        for _ in 0 ... Int.random(in: 0 ... 3) {
            commentObjects.append(CommentObject(description: comments.randomElement()!, registeredAt: generateDate()))
        }
        return commentObjects
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
