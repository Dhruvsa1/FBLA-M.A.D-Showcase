//
//  Club.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/5/24.
//

import Foundation

/// `Club` is a structure that conforms to `Encodable`, `Identifiable`, and `Hashable` protocols, suitable for representing club entities within the application. This model is designed for encoding to JSON, unique identification in SwiftUI views, and can be used in collections that require hashing.
struct Club: Encodable, Identifiable, Hashable {
    /// A unique identifier for the club, automatically generated as a new UUID.
    var id = UUID()
    /// The name of the club.
    var name: String
    /// A description of the club, detailing its purpose, activities, and any other relevant information.
    var description: String
}
