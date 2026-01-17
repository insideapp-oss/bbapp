//
//  Club.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Club model based on the OpenAPI schema.
/// Represents a sports club with its location, venue, and contact information.
///
/// Schema reference: `#/components/schemas/Club` in `openapi.json`
struct Club: Identifiable, Codable {
    let id: String
    let name: String
    let sport: Sport
    let countryCode: String
    let websiteUrl: String?
    let location: Location?
    let venue: Venue?
    let phoneNumber: String?
    let email: String?
    let color: String?
}
