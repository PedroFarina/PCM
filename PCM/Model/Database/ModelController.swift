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
            ActivityObject(name: "Chão do Banheiro",
                           description: "Concluir o chão do banheiro. A quantidade do serviço estabelecida é de 4m.",
                           state: .todo,
                           serviceValue: 5,
                           startedAt: generateDate(),
                           timeElapsed: 0,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Chão da Cozinha",
                           description: "Concluir o chão da cozinha. A quantidade do serviço estabelecida é de 7m.",
                           state: .doing,
                           serviceValue: 7,
                           startedAt: generateDate(),
                           timeElapsed: 0,
                           workingUnits: [], impeditives: [], comments: []),
            ActivityObject(name: "Construção de pilar",
                           description: "Cimentar o pilar da cozinha. A quantidade do serviço estabelecide é de 5m.",
                           state: .doing,
                           serviceValue: 5,
                           startedAt: generateDate(),
                           timeElapsed: 14400,
                           workingUnits: [], impeditives: generateImpeditives(), comments: generateComments()),
            ActivityObject(name: "Instalação de porcelanato no banheiro",
                           description: "Instalar o porcelanato no banheiro. A quantidade do serviço estabelecido é 45m.",
                           state: .done,
                           serviceValue: 45,
                           startedAt: generateDate(),
                           timeElapsed: 12454,
                           workingUnits: [], impeditives: generateImpeditives(), comments: generateComments())
        ]
        let workingUnits = generateWorkingUnits()
        for unit in workingUnits {
            objects[2].addWorkingUnit(unit, at: generateDate())
        }
        objects[2].removeWorkingUnit(workingUnits[1])
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
            let workingUnitObject = WorkingUnitObject(category: category, description: desc)
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
    internal static func createWorkingUnit(with description: String, and category: WorkingUnitCategory) -> PCMWorkingUnit {
        WorkingUnitObject(category: category, description: description)
    }
    internal static func createComment(with description: String) -> CommentObject {
        CommentObject(description: description, registeredAt: generateDate())
    }
    internal static func createImpeditive(with category: PCMImpeditiveCategory, and subcategory: String, for time: TimeInterval) -> PCMImpeditive {
        ImpeditiveObject(category: category, subcategory: subcategory, timeSpent: time, registeredAt: generateDate())
    }

}
