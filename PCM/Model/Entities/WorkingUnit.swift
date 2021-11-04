//
//  WorkingUnit.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

internal enum WorkingUnitCategory: String {
    case person = "P"
    case equipment = "E"
}

internal enum WorkingUnitSubcategory: String {
    case official = "O"
    case nonOfficial = "MO"
    case none = "E"
}

internal protocol PCMWorkingUnit {
    var category: WorkingUnitCategory { get }
    var subcategory: WorkingUnitSubcategory { get }
    var title: String { get }
    var description: String { get }
}
