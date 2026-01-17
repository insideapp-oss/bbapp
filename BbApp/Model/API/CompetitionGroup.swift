//
//  CompetitionGroup.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Competition group model based on the OpenAPI schema.
/// Represents a group within a competition with its associated phase.
///
/// Schema reference: `#/components/schemas/CompetitionGroup` in `openapi.json`
struct CompetitionGroup: Identifiable, Codable {
    let id: String
    let name: String
    let competition: Competition
    let phase: CompetitionPhase
}
