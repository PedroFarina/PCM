//
//  Activity.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal enum ActivityState {
    case todo
    case doing
    case done
}

internal protocol PCMActivity {
    var name: String { get }
    var description: String { get }
    var timeSpent: TimeInterval { get }
    var state: ActivityState { get }
    var serviceValue: Double { get }
}