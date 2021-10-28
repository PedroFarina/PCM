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

    private static let categories: [PCMImpeditiveCategory] = [EquipmentCategory(), WorkerCategory(), MaterialCategory(), NatureCategory()]

    internal static func getMockedActivities() -> [PCMActivity] {
        return [
            ActivityObject(name: "Chão do Banheiro",
                           description: "Fazer o rolezinho",
                           state: .todo,
                           serviceValue: 15,
                           startedAt: Date(),
                           timeElapsed: 0,
                           workingUnits: generateWorkingUnits(), impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Chão da Cozinha",
                           description: "Fazer o rolezinho",
                           state: .doing,
                           serviceValue: 15,
                           startedAt: Date(),
                           timeElapsed: 0,
                           workingUnits: generateWorkingUnits(), impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Chão do Quarto",
                           description: "Fazer o rolezinho",
                           state: .doing,
                           serviceValue: 15,
                           startedAt: Date(),
                           timeElapsed: 0,
                           workingUnits: generateWorkingUnits(), impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Chão do Outro Quarto",
                           description: "Fazer o rolezinho",
                           state: .done,
                           serviceValue: 15,
                           startedAt: Date(),
                           timeElapsed: 0,
                           workingUnits: generateWorkingUnits(), impeditives: generateImpeditives(), comments: generateComments())
        ]
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
            let workingUnitObject = WorkingUnitObject(category: category, description: desc)
            workingUnitObjects.append(workingUnitObject)
        }
        return workingUnitObjects
    }
    private static func generateImpeditives() -> [ImpeditiveObject] {
        var impeditiveObjects: [ImpeditiveObject] = []
        for _ in 0 ... Int.random(in: 1 ... 7) {
            let category = categories.randomElement()!
            let subCategory = category.subcategories.randomElement()!
            impeditiveObjects.append(ImpeditiveObject(category: category,
                                                      subcategory: subCategory,
                                                      timeSpent: .random(in: 0 ... 6000),
                                                      registeredAt: Date()))
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
            commentObjects.append(CommentObject(description: comments.randomElement()!, registeredAt: Date()))
        }
        return commentObjects
    }

    internal static func getImpeditiveCategories() -> [PCMImpeditiveCategory] {
        return []
    }
    internal static func createWorkingUnit(with description: String, and category: WorkingUnitCategory) -> PCMWorkingUnit {
        WorkingUnitObject(category: category, description: description)
    }
    internal static func createComment(with description: String) -> PCMActivityLogItem {
        CommentObject(description: description, registeredAt: Date())
    }
    internal static func createImpeditive(with category: PCMImpeditiveCategory, and subcategory: String, for time: TimeInterval) -> PCMImpeditive {
        ImpeditiveObject(category: category, subcategory: subcategory, timeSpent: time, registeredAt: Date())
    }

}
