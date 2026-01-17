//
//  Competition.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Competition model based on the OpenAPI schema.
/// Represents a sports competition with its type, gender, and category information.
///
/// Schema reference: `#/components/schemas/Competition` in `openapi.json`
struct Competition: Identifiable, Codable {
    let id: String
    let name: String
    let shortName: String?
    let sport: Sport
    let countryCode: String
    let gender: CompetitionGender?
    let category: String?
    let type: CompetitionType?
    let year: UInt16?
}
