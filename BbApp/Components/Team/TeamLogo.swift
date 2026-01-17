//
//  TeamLogo.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import SwiftUI
import UIKit

/// A reusable SwiftUI component that displays team logos from local assets.
/// Supports multiple size variants, fallback placeholders with team initials, and accessibility.
///
/// The component loads team logos from `Assets.xcassets/TeamLogos/` using the team's ID.
/// If the logo asset is missing, it displays a circular placeholder with team initials.
///
/// Example:
/// ```swift
/// TeamLogo(team: team)
///     .teamLogoSize(.large)
/// ```
struct TeamLogo: View {
    /// The team to display the logo for
    let team: Team

    @Environment(\.teamLogoSize) private var size

    var body: some View {
        
        Group {
            if imageExists {
                logoImage
            } else {
                initialsPlaceholder
            }
        }
        .frame(width: size.value, height: size.value)
        .accessibilityLabel("\(team.name) logo")
        .accessibilityAddTraits(.isImage)
    }
    
    // MARK: - Private Views
    
    /// The logo image view
    private var logoImage: some View {
        Image(team.id)
            .resizable()
            .renderingMode(.original)
            .scaledToFit()
            .frame(width: size.value, height: size.value)
    }
    
    /// The initials placeholder view
    private var initialsPlaceholder: some View {
        Circle()
            .fill(team.color)
            .overlay(
                Text(extractInitials(from: team.name))
                    .font(.system(size: fontSize, weight: .semibold))
                    .foregroundColor(.textPrimary)
            )
    }
    
    // MARK: - Private Helpers
    
    /// Checks if the image asset exists in the asset catalog
    private var imageExists: Bool {
        UIImage(named: team.id) != nil
    }
    
    /// Calculates the font size for initials based on logo size
    private var fontSize: CGFloat {
        switch size {
        case .large:
            return 30
        case .medium:
            return 20
        case .small:
            return 12
        case .custom(let customSize):
            // Scale font proportionally to custom size
            return customSize * 0.4
        }
    }
    
    /// Extracts initials from a team name.
    ///
    /// Takes the first character of the first two words, or first character if only one word.
    /// Examples: "AS Monaco" → "AM", "Lyon" → "L"
    ///
    /// - Parameter name: The team name to extract initials from
    /// - Returns: A string containing up to 2 uppercase characters
    private func extractInitials(from name: String) -> String {
        let words = name.split(separator: " ")
        let initials = words.prefix(2).compactMap { $0.first }.map(String.init)
        let result = initials.joined().uppercased()
        
        // Fallback to "?" if no initials can be extracted
        return result.isEmpty ? "?" : result
    }
}

// MARK: - Previews

#Preview("Large Size") {
    TeamLogo(team: .previewASM)
        .teamLogoSize(.large)
        .padding()
}

#Preview("Medium Size") {
    TeamLogo(team: .previewASM)
        .teamLogoSize(.medium)
        .padding()
}

#Preview("Small Size") {
    TeamLogo(team: .previewASM)
        .teamLogoSize(.small)
        .padding()
}

#Preview("All Sizes") {
    HStack(spacing: 20) {
        TeamLogo(team: .previewASM)
            .teamLogoSize(.large)
        TeamLogo(team: .previewASM)
            .teamLogoSize(.medium)
        TeamLogo(team: .previewASM)
            .teamLogoSize(.small)
    }
    .padding()
}

#Preview("Fallback Placeholder") {
    TeamLogo(team: .previewMissingAsset)
        .teamLogoSize(.medium)
        .padding()
}

#Preview("Multiple Teams") {
    VStack(spacing: 20) {
        HStack(spacing: 15) {
            TeamLogo(team: .previewASM)
                .teamLogoSize(.medium)
            TeamLogo(team: .previewASVEL)
                .teamLogoSize(.medium)
            TeamLogo(team: .previewBCM)
                .teamLogoSize(.medium)
        }
        HStack(spacing: 15) {
            TeamLogo(team: .previewCHB)
                .teamLogoSize(.medium)
            TeamLogo(team: .previewCSP)
                .teamLogoSize(.medium)
            TeamLogo(team: .previewELC)
                .teamLogoSize(.medium)
        }
    }
    .padding()
}

