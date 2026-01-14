//
//  CompetitionType.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Competition type enum based on the OpenAPI schema.
/// Represents the type of competition format.
///
/// Schema reference: `#/components/schemas/CompetitionType` in `openapi.json`
enum CompetitionType: String, Codable {
    case cup = "Cup"
    case league = "League"
    case tournament = "Tournament"
}
