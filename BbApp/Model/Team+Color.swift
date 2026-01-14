//
//  Team+Color.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import SwiftUI

extension Team {
    /// Returns the team's color for use in placeholders and UI elements.
    /// Uses the club's color if available, otherwise generates a deterministic random color.
    ///
    /// - Returns: A Color instance representing the team's color
    ///
    /// Example:
    /// ```swift
    /// let teamColor = team.color
    /// Circle()
    ///     .fill(teamColor)
    /// ```
    var color: Color {
        // Try to use club color if available
        if let clubColorHex = club.color, !clubColorHex.isEmpty {
            return Color(hex: clubColorHex)
        }

        // Fallback to deterministic random color based on team ID
        return Color.randomColor(seed: id)
    }
}
