//
//  GPA.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/7/24.
//

import Foundation

/// `GPA` is a structure conforming to the `Encodable` protocol, designed to represent a student's Grade Point Average (GPA) within an educational or academic application. This model allows for encoding to JSON for network communication, facilitating the sharing and storage of GPA information in a digital format.
struct GPA: Encodable {
    /// An optional `Double` value representing the weighted GPA, which takes into account the difficulty of courses (e.g., honors, AP) in addition to regular grading.
    var weighted: Double?
    /// An optional `Double` value representing the unweighted GPA, calculated without considering the course difficulty, based solely on the grades obtained.
    var unweighted: Double?
}
