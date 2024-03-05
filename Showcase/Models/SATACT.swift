//
//  SATACT.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/8/24.
//

import Foundation

/// `SATACT` is a structure that conforms to the `Encodable` protocol, designed to store standardized test scores for the SAT and ACT exams. This model allows for encoding to JSON, facilitating the storage or transmission of test scores in digital formats, such as for academic applications or profile information.
struct SATACT: Encodable {
    /// An optional `Double` value representing the SAT score. This property can store scores from the SAT exam, which are typically within the range of 400 to 1600.
    var SAT: Double?
    /// An optional `Double` value representing the ACT score. This property can store scores from the ACT exam, which are typically within the range of 1 to 36.
    var ACT: Double?
}
