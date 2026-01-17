//
//  CompetitionPhase.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Competition phase model based on the OpenAPI schema.
/// Represents a phase within a competition.
///
/// Schema reference: `#/components/schemas/CompetitionPhase` in `openapi.json`
struct CompetitionPhase: Codable {
    let name: String
    let type: CompetitionType?
}
