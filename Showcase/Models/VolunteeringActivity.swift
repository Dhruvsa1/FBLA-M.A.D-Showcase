//
//  VolunteeringActivity.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/6/24.
//

import Foundation

/// `VolunteeringActivity` is a structure that conforms to `Identifiable` and `Encodable` protocols, designed to represent a volunteering activity within the application. It is suitable for encoding to JSON for network operations and can be uniquely identified within SwiftUI interfaces.
struct VolunteeringActivity: Identifiable, Encodable {
    /// A unique identifier for the volunteering activity, automatically generated as a new UUID.
    var id = UUID()
    /// The title of the volunteering activity.
    var title: String
    /// A detailed description of the volunteering activity, including the nature of the work, goals, and impact.
    var description: String
    /// The total hours of service contributed in this activity, represented as a string.
    var hoursOfService: String
}
