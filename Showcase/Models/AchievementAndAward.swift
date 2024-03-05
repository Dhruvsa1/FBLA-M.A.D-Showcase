//
//  Club.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/5/24.
//

import Foundation

/// `AchievementAndAward` is a structure that conforms to the `Encodable`, `Identifiable`, and `Hashable` protocols. It is designed to represent an achievement or award within the application. This model is used to encode achievements and awards to JSON for network communication, uniquely identify them within SwiftUI views, and utilize them in collections requiring hashable elements.
struct AchievementAndAward: Encodable, Identifiable, Hashable {
    /// A unique identifier for the achievement or award, automatically generated as a new UUID.
    var id = UUID()
    /// The name of the achievement or award.
    var name: String
    /// A description of the achievement or award, detailing its significance, the criteria for receiving it, or any other relevant information.
    var description: String
}
