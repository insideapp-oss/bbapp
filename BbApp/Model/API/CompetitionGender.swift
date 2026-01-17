//
//  CompetitionGender.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Competition gender enum based on the OpenAPI schema.
/// Represents the gender category of a competition.
///
/// Schema reference: `#/components/schemas/CompetitionGender` in `openapi.json`
enum CompetitionGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case mixed = "Mixed"
}
