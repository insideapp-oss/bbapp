//
//  Team.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Team model based on the OpenAPI schema.
/// Represents a team in a competition with its associated club and competition details.
///
/// Schema reference: `#/components/schemas/Team` in `openapi.json`
struct Team: Identifiable, Codable {
    /// Unique team identifier (required)
    let id: String

    /// Canonical display name for the team (required)
    /// Used for accessibility labels and generating initials fallback
    let name: String

    /// Optional team number
    let number: UInt32?

    /// Associated club
    let club: Club

    /// Associated competition
    let competition: Competition

    /// Competition groups the team belongs to
    let groups: [CompetitionGroup]
}
