//
//  Location.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Location model based on the OpenAPI schema.
/// Represents a geographic location with address and coordinates.
///
/// Schema reference: `#/components/schemas/Location` in `openapi.json`
struct Location: Codable {
    let street: String?
    let city: String
    let postalCode: String
    let countryCode: String
    let lat: Double?
    let lng: Double?
}
