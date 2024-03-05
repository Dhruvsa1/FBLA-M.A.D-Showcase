//
//  Athletics.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import Foundation

struct Athletic: Codable, Identifiable, Hashable {
    var id: UUID?
    var sports: [String]
    var isCaptain: Bool
    
}
