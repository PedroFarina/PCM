//
//  WorkingUnitObject.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

internal struct WorkingUnitObject: PCMWorkingUnit, Equatable {
    var category: WorkingUnitCategory
    var subcategory: WorkingUnitSubcategory
    var title: String
    var description: String
}
