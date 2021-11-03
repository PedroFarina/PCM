//
//  Impeditive.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal protocol PCMImpeditive: PCMActivityLogItem {
    var category: PCMImpeditiveCategory { get }
    var subcategory: String { get }
    var timeSpent: TimeInterval { get }
}

internal protocol PCMImpeditiveCategory {
    var description: String { get }
    var subcategories: [String] { get }
    var appliesToAll: Bool { get }
}
