//
//  Impeditive.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal protocol PCMImpeditive {
    var category: String { get }
    var subcategory: String { get }
    var timeSpent: TimeInterval { get }
    var registeredAt: Date { get }
}
