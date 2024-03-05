//
//  User.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/4/24.
//

import Foundation

/// `User` is a structure that conforms to `Encodable`, `Decodable`, and `Identifiable` protocols, making it suitable for both JSON encoding/decoding and identification within SwiftUI views. This model represents a user entity in the application with various personal details.
struct User: Encodable, Decodable, Identifiable {
    /// A unique identifier for the user, typically a UUID string.
    let id: String
    /// The user's first name.
    let fname: String
    /// The user's last name.
    let lname: String
    /// A unique username selected by the user.
    let username: String
    /// A password chosen by the user, stored in plain text (note: storing passwords in plain text is not recommended in production applications).
    let password: String
    /// The user's email address.
    let email: String
    /// The user's phone number.
    let phoneNumber: String
    /// The user's physical address.
    let address: String
    /// A Boolean value indicating whether the user has completed the initial setup process.
    let setUpDone: Bool
    /// The user's date of birth.
    let birthday: Date
}
