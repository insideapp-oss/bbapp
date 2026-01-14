//
//  Typography.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import SwiftUI

// MARK: - Font Family Constants

private enum MontserratFont {
    static let regular = "Montserrat-Regular"
    static let semiBold = "Montserrat-SemiBold"
    static let bold = "Montserrat-Bold"
}

// MARK: - Font Extensions

extension Font {
    // MARK: - Title Styles
    
    /// Title Large - 24px, Bold (700)
    /// Used for main headlines and app bar titles.
    static let titleLarge = Font.custom(MontserratFont.bold, size: 24)
    
    /// Title Medium - 18px, SemiBold (600)
    /// Used for section headers and important text.
    static let titleMedium = Font.custom(MontserratFont.semiBold, size: 18)
    
    /// Title Small - 16px, Bold (700)
    /// Used for card titles and emphasized text.
    static let titleSmall = Font.custom(MontserratFont.bold, size: 16)
    
    // MARK: - Body Styles
    
    /// Body Large - 16px, Bold (700)
    /// Used for primary content text.
    static let bodyLarge = Font.custom(MontserratFont.bold, size: 16)
    
    /// Body Medium - 14px, Regular (400)
    /// Used for standard body text.
    static let bodyMedium = Font.custom(MontserratFont.regular, size: 14)
    
    /// Body Small - 12px, Regular (400)
    /// Used for secondary information and captions.
    static let bodySmall = Font.custom(MontserratFont.regular, size: 12)
    
    // MARK: - Headline Styles
    
    /// Headline Large - 24px base, Bold (700), scales with Dynamic Type
    /// Used for day numbers in game cards.
    /// Base size is 24px, but scales up to 32px with Dynamic Type.
    static func headlineLarge(sizeCategory: ContentSizeCategory = .medium) -> Font {
        let baseSize: CGFloat = 24
        let scaledSize = baseSize * sizeCategory.scaleFactor
        return Font.custom(MontserratFont.bold, size: min(scaledSize, 32))
    }
    
    /// Headline Medium - 20px base, Bold/Regular, scales with Dynamic Type
    /// Used for scores in game cards.
    /// Base size is 20px, but scales up to 24px with Dynamic Type.
    static func headlineMedium(sizeCategory: ContentSizeCategory = .medium, isBold: Bool = true) -> Font {
        let baseSize: CGFloat = 20
        let scaledSize = baseSize * sizeCategory.scaleFactor
        let fontName = isBold ? MontserratFont.bold : MontserratFont.regular
        return Font.custom(fontName, size: min(scaledSize, 24))
    }
    
    // MARK: - Special Styles
    
    /// App Bar Title - 24px, Bold, White color
    /// Used for navigation bar titles.
    static let appBarTitle = Font.custom(MontserratFont.bold, size: 24)
}

// MARK: - ContentSizeCategory Extension

private extension ContentSizeCategory {
    /// Scale factor for Dynamic Type support.
    /// Returns a multiplier based on the content size category.
    var scaleFactor: CGFloat {
        switch self {
        case .extraSmall: return 0.82
        case .small: return 0.88
        case .medium: return 1.0
        case .large: return 1.12
        case .extraLarge: return 1.24
        case .extraExtraLarge: return 1.35
        case .extraExtraExtraLarge: return 1.47
        case .accessibilityMedium: return 1.65
        case .accessibilityLarge: return 1.88
        case .accessibilityExtraLarge: return 2.12
        case .accessibilityExtraExtraLarge: return 2.35
        case .accessibilityExtraExtraExtraLarge: return 2.65
        @unknown default: return 1.0
        }
    }
}

// MARK: - View Modifiers for Special Text Styles

extension View {
    /// Applies the App Bar Title style (24px, Bold, White).
    /// - Returns: A view with the app bar title styling applied.
    func appBarTitleStyle() -> some View {
        self
            .font(.appBarTitle)
            .foregroundColor(.textOnDark)
    }
    
    /// Applies emphasis styling (SemiBold weight) to body text.
    /// - Returns: A view with emphasis styling applied.
    func emphasisText() -> some View {
        self
            .font(.custom(MontserratFont.semiBold, size: 14))
    }
    
    /// Applies header text styling (small caps) for section headers.
    /// - Returns: A view with header text styling applied.
    func headerText() -> some View {
        self
            .font(.titleMedium)
            .textCase(.uppercase)
    }
    
    /// Applies winner text styling (Bold weight) for winning team names and scores.
    /// - Returns: A view with winner text styling applied.
    func winnerText() -> some View {
        self
            .fontWeight(.bold)
    }
}

// MARK: - Dynamic Type Support

extension Text {
    /// Creates a text view with Dynamic Type support for headline styles.
    /// - Parameters:
    ///   - text: The text content to display
    ///   - style: The headline style to use
    ///   - sizeCategory: The content size category (defaults to environment value)
    /// - Returns: A text view with the specified headline style
    func headlineLarge(sizeCategory: ContentSizeCategory = .medium) -> Text {
        self.font(.headlineLarge(sizeCategory: sizeCategory))
    }
    
    /// Creates a text view with Dynamic Type support for medium headline styles.
    /// - Parameters:
    ///   - text: The text content to display
    ///   - style: The headline style to use
    ///   - sizeCategory: The content size category (defaults to environment value)
    ///   - isBold: Whether to use bold weight (default: true)
    /// - Returns: A text view with the specified headline style
    func headlineMedium(sizeCategory: ContentSizeCategory = .medium, isBold: Bool = true) -> Text {
        self.font(.headlineMedium(sizeCategory: sizeCategory, isBold: isBold))
    }
}
