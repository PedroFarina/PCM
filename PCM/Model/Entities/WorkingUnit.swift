//
//  WorkingUnit.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

internal enum WorkingUnitCategory {
    case person
    case equipment
}

internal protocol PCMWorkingUnit {
    var category: WorkingUnitCategory { get }
    var description: String { get }
}
