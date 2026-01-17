//
//  Sport.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Sport enum based on the OpenAPI schema.
/// Represents the type of sport.
///
/// Schema reference: `#/components/schemas/Sport` in `openapi.json`
enum Sport: String, Codable {
    case basketball = "Basketball"
    case football = "Football"
}
