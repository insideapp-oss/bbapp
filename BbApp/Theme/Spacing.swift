//
//  Spacing.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import SwiftUI

/// Standardized spacing values for consistent layout throughout the app.
/// All values are in points (1px = 1pt for @1x displays).
enum Spacing {
    /// XS - 4pt
    /// Minimal spacing between tight elements.
    static let xs: CGFloat = 4
    
    /// Small - 8pt
    /// Standard spacing between related elements.
    static let small: CGFloat = 8
    
    /// Medium - 16pt
    /// Spacing between distinct elements.
    static let medium: CGFloat = 16
    
    /// Large - 24pt
    /// Section padding and major element separation.
    static let large: CGFloat = 24
    
    /// XL - 32pt
    /// Screen margins and major section breaks.
    static let xl: CGFloat = 32
}

// MARK: - Common Spacing Patterns

extension Spacing {
    /// Card Internal Padding - 16pt to 24pt
    /// Used for padding inside cards.
    static let cardPadding: CGFloat = 16
    static let cardPaddingLarge: CGFloat = 24
    
    /// Screen Padding - Horizontal 16pt to 24pt
    /// Used for horizontal screen margins.
    static let screenHorizontalPadding: CGFloat = 16
    static let screenHorizontalPaddingLarge: CGFloat = 24
    
    /// Section Padding - 8pt to 16pt between sections
    /// Used for spacing between sections.
    static let sectionPadding: CGFloat = 8
    static let sectionPaddingLarge: CGFloat = 16
    
    /// Icon + Text Spacing - 4pt to 8pt
    /// Used for spacing between icons and text.
    static let iconTextSpacing: CGFloat = 4
    static let iconTextSpacingLarge: CGFloat = 8
    
    /// List Item Vertical - 16pt top and bottom
    /// Used for vertical padding in list items.
    static let listItemVertical: CGFloat = 16
    
    /// Content Stacking - 8pt to 16pt between stacked elements
    /// Used for spacing between vertically stacked content.
    static let contentStacking: CGFloat = 8
    static let contentStackingLarge: CGFloat = 16
}

// MARK: - View Modifiers for Common Spacing Patterns

extension View {
    /// Applies card padding (16pt) to the view.
    /// - Returns: A view with card padding applied.
    func cardPadding() -> some View {
        self.padding(Spacing.cardPadding)
    }
    
    /// Applies large card padding (24pt) to the view.
    /// - Returns: A view with large card padding applied.
    func cardPaddingLarge() -> some View {
        self.padding(Spacing.cardPaddingLarge)
    }
    
    /// Applies horizontal screen padding (16pt) to the view.
    /// - Returns: A view with horizontal screen padding applied.
    func screenHorizontalPadding() -> some View {
        self.padding(.horizontal, Spacing.screenHorizontalPadding)
    }
    
    /// Applies large horizontal screen padding (24pt) to the view.
    /// - Returns: A view with large horizontal screen padding applied.
    func screenHorizontalPaddingLarge() -> some View {
        self.padding(.horizontal, Spacing.screenHorizontalPaddingLarge)
    }
    
    /// Applies section padding (8pt) to the view.
    /// - Returns: A view with section padding applied.
    func sectionPadding() -> some View {
        self.padding(Spacing.sectionPadding)
    }
    
    /// Applies large section padding (16pt) to the view.
    /// - Returns: A view with large section padding applied.
    func sectionPaddingLarge() -> some View {
        self.padding(Spacing.sectionPaddingLarge)
    }
}
