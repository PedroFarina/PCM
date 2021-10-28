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

    internal static func getMockedActivities() -> [PCMActivity] {
        return []
    }
    internal static func getImpeditiveCategories() -> [PCMImpeditiveCategory] {
        return []
    }
    internal static func createWorkingUnit(with description: String, and category: WorkingUnitCategory) -> PCMWorkingUnit {
        fatalError()
    }
    internal static func createComment(with description: String) -> PCMActivityLogItem {
        fatalError()
    }
    internal static func createImpeditive(with category: PCMImpeditiveCategory, and subcategory: String, for time: TimeInterval) -> PCMImpeditive {
        fatalError()
    }

}
