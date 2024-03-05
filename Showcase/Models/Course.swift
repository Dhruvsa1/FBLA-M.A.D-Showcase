import Foundation
import SwiftUI

/// `Course` is a structure that conforms to `Identifiable`, `Hashable`, and `Encodable` protocols, designed to represent academic courses within an application. It supports unique identification for SwiftUI views, can be used in collections requiring hashable elements, and is suitable for encoding to JSON for network communication. This model is particularly useful for educational apps or systems managing course catalogs.
struct Course: Identifiable, Hashable, Encodable {
    /// A unique identifier for the course, automatically generated as a new UUID. This ensures each course is distinct and easily identifiable.
    let id: UUID = UUID()
    /// The name of the course. This could be the official title or a short name used within the app.
    var name: String
    /// The subject area to which the course belongs, such as Mathematics, Science, or Humanities.
    var subject: String
    /// A Boolean value indicating whether the course is an elective or a required part of a curriculum.
    var isElective: Bool
}
