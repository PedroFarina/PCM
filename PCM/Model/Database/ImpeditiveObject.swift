//
//  ImpeditiveObject.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal struct ImpeditiveObject: PCMImpeditive {
    var category: PCMImpeditiveCategory
    var subcategory: String
    var timeSpent: TimeInterval
    var description: String
    var registeredAt: Date
}
