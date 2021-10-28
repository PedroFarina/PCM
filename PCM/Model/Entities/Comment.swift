//
//  Comment.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

import Foundation

internal protocol PCMComment {
    var description: String { get }
    var registeredAt: Date { get }
}
