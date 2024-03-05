import Foundation

/// `Experience` is a structure that conforms to `Identifiable` and `Encodable` protocols, designed to represent professional or personal experiences. It is ideal for encoding to JSON for network communication and can be uniquely identified within SwiftUI views, facilitating its use in user interfaces that display a list of experiences.
struct Experience: Identifiable, Encodable {
    /// A unique identifier for the experience, automatically generated as a new UUID. This ensures each experience is distinct for identification purposes.
    var id = UUID()
    /// The role or title associated with the experience. This could represent a job title, volunteer position, or any significant role undertaken by the individual.
    var role: String
    /// A detailed description of the experience, including responsibilities, achievements, and the skills developed during this period.
    var description: String
}
