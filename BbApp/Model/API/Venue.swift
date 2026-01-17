//
//  Venue.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Venue model based on the OpenAPI schema.
/// Represents a sports venue with its location information.
///
/// Schema reference: `#/components/schemas/Venue` in `openapi.json`
struct Venue: Identifiable, Codable {
    let id: String
    let name: String
    let secondaryName: String?
    let location: Location
}
