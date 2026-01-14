//
//  CornerRadius.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import SwiftUI

/// Standardized corner radius values for consistent UI components.
/// All values are in points (1px = 1pt for @1x displays).
enum CornerRadius {
    /// Standard - 8pt
    /// Used for standard UI element corners.
    static let standard: CGFloat = 8
    
    /// Card - 12pt
    /// Used for game cards and card-style containers.
    static let card: CGFloat = 12
    
    /// Pill - 12pt
    /// Used for time/date pills and pill-shaped elements.
    static let pill: CGFloat = 12
    
    /// Button - 8pt
    /// Used for buttons and interactive elements.
    static let button: CGFloat = 8
}

// MARK: - View Modifiers for Corner Radius

extension View {
    /// Applies standard corner radius (8pt) to the view.
    /// - Returns: A view with standard corner radius applied.
    func cornerRadiusStandard() -> some View {
        self.cornerRadius(CornerRadius.standard)
    }
    
    /// Applies card corner radius (12pt) to the view.
    /// - Returns: A view with card corner radius applied.
    func cornerRadiusCard() -> some View {
        self.cornerRadius(CornerRadius.card)
    }
    
    /// Applies pill corner radius (12pt) to the view.
    /// - Returns: A view with pill corner radius applied.
    func cornerRadiusPill() -> some View {
        self.cornerRadius(CornerRadius.pill)
    }
    
    /// Applies button corner radius (8pt) to the view.
    /// - Returns: A view with button corner radius applied.
    func cornerRadiusButton() -> some View {
        self.cornerRadius(CornerRadius.button)
    }
}

// MARK: - RoundedRectangle Convenience Extensions

extension RoundedRectangle {
    /// Creates a rounded rectangle with standard corner radius (8pt).
    static var standard: RoundedRectangle {
        RoundedRectangle(cornerRadius: CornerRadius.standard)
    }
    
    /// Creates a rounded rectangle with card corner radius (12pt).
    static var card: RoundedRectangle {
        RoundedRectangle(cornerRadius: CornerRadius.card)
    }
    
    /// Creates a rounded rectangle with pill corner radius (12pt).
    static var pill: RoundedRectangle {
        RoundedRectangle(cornerRadius: CornerRadius.pill)
    }
    
    /// Creates a rounded rectangle with button corner radius (8pt).
    static var button: RoundedRectangle {
        RoundedRectangle(cornerRadius: CornerRadius.button)
    }
}
