//
//  Colors.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import SwiftUI

extension Color {
    // MARK: - Primary Colors

    /// Primary Red - Main brand color for app bars, buttons, and primary actions.
    /// Hex: #DA2F16
    static let primaryRed = Color(hex: "#DA2F16")

    /// Secondary Red - Darker shade for gradients and headers.
    /// Hex: #A62818
    static let secondaryRed = Color(hex: "#A62818")

    /// Tertiary Gold - Accent color for time pills, highlights, and special elements.
    /// Hex: #D4AB37
    static let tertiaryGold = Color(hex: "#D4AB37")

    // MARK: - Neutral Colors

    /// Black - Used for text and icons.
    /// Hex: #000000
    static let brandBlack = Color(hex: "#000000")

    /// White - Used for backgrounds and text on dark surfaces.
    /// Hex: #FFFFFF
    static let brandWhite = Color(hex: "#FFFFFF")

    /// Light Gray - Used for dividers and subtle backgrounds.
    /// Hex: #E0E0E0
    static let lightGray = Color(hex: "#E0E0E0")

    /// Medium Gray - Used for unselected navigation items and secondary text.
    /// Hex: #9E9E9E
    static let mediumGray = Color(hex: "#9E9E9E")
}

// MARK: - Convenience Aliases

extension Color {
    /// Convenience alias for brand black (text color).
    static let textPrimary = brandBlack

    /// Convenience alias for medium gray (secondary text color).
    static let textSecondary = mediumGray

    /// Convenience alias for brand white (background on dark surfaces).
    static let textOnDark = brandWhite

    /// Convenience alias for primary red (brand accent).
    static let brandAccent = primaryRed
}
