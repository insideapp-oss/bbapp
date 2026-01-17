//
//  TeamLogoSize.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import SwiftUI

/// Size variants for team logos used throughout the app.
/// Provides consistent sizing across different contexts (game cards, standings, etc.).
enum TeamLogoSize {
    /// Large size: 75px (used in FeaturedGameCard)
    case large

    /// Medium size: 48px (used in regular GameCard, default)
    case medium

    /// Small size: 30px (used in Standings screen)
    case small

    /// Custom size in points
    case custom(CGFloat)

    /// Size value in points
    var value: CGFloat {
        switch self {
        case .large:
            return 75
        case .medium:
            return 48
        case .small:
            return 30
        case .custom(let size):
            return size
        }
    }
}

// MARK: - Environment Key

extension EnvironmentValues {
    @Entry var teamLogoSize: TeamLogoSize = .medium
}

extension View {
    /// Sets the default team logo size for this view hierarchy.
    func teamLogoSize(_ size: TeamLogoSize) -> some View {
        environment(\.teamLogoSize, size)
    }
}
