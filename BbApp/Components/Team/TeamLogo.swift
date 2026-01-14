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
/// TeamLogo(team: team, size: .medium)
/// TeamLogo(team: team, size: .large)
/// ```
struct TeamLogo: View {
    /// The team to display the logo for
    let team: Team
    
    /// The size variant for the logo
    let size: TeamLogoSize
    
    /// Initializes a team logo view.
    ///
    /// - Parameters:
    ///   - team: The team to display the logo for
    ///   - size: The size variant (defaults to `.medium`)
    init(team: Team, size: TeamLogoSize = .medium) {
        self.team = team
        self.size = size
    }
    
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
    TeamLogo(team: .previewASM, size: .large)
        .padding()
}

#Preview("Medium Size") {
    TeamLogo(team: .previewASM, size: .medium)
        .padding()
}

#Preview("Small Size") {
    TeamLogo(team: .previewASM, size: .small)
        .padding()
}

#Preview("All Sizes") {
    HStack(spacing: 20) {
        TeamLogo(team: .previewASM, size: .large)
        TeamLogo(team: .previewASM, size: .medium)
        TeamLogo(team: .previewASM, size: .small)
    }
    .padding()
}

#Preview("Fallback Placeholder") {
    TeamLogo(team: .previewMissingAsset, size: .medium)
        .padding()
}

#Preview("Multiple Teams") {
    VStack(spacing: 20) {
        HStack(spacing: 15) {
            TeamLogo(team: .previewASM, size: .medium)
            TeamLogo(team: .previewASVEL, size: .medium)
            TeamLogo(team: .previewBCM, size: .medium)
        }
        HStack(spacing: 15) {
            TeamLogo(team: .previewCHB, size: .medium)
            TeamLogo(team: .previewCSP, size: .medium)
            TeamLogo(team: .previewELC, size: .medium)
        }
    }
    .padding()
}

// MARK: - Preview Helpers

extension Team {
    /// Preview team with ASM logo (asset exists)
    static var previewASM: Team {
        createPreviewTeam(id: "ASM", name: "AS Monaco")
    }
    
    /// Preview team with ASVEL logo (asset exists)
    static var previewASVEL: Team {
        createPreviewTeam(id: "ASVEL", name: "ASVEL Lyon-Villeurbanne")
    }
    
    /// Preview team with BCM logo (asset exists)
    static var previewBCM: Team {
        createPreviewTeam(id: "BCM", name: "BCM Gravelines")
    }
    
    /// Preview team with CHB logo (asset exists)
    static var previewCHB: Team {
        createPreviewTeam(id: "CHB", name: "Cholet Basket")
    }
    
    /// Preview team with CSP logo (asset exists)
    static var previewCSP: Team {
        createPreviewTeam(id: "CSP", name: "CSP Limoges")
    }
    
    /// Preview team with ELC logo (asset exists)
    static var previewELC: Team {
        createPreviewTeam(id: "ELC", name: "Elan Chalon")
    }
    
    /// Preview team with missing asset (will show placeholder)
    static var previewMissingAsset: Team {
        createPreviewTeam(id: "MISSING", name: "Test Team")
    }
    
    /// Helper to create preview team data
    private static func createPreviewTeam(id: String, name: String) -> Team {
        let sport = Sport.basketball
        let club = Club(
            id: "club-\(id)",
            name: name,
            sport: sport,
            countryCode: "FR",
            websiteUrl: nil,
            location: nil,
            venue: nil,
            phoneNumber: nil,
            email: nil,
            color: nil
        )
        let competition = Competition(
            id: "comp-1",
            name: "Betclic Elite",
            shortName: "Elite",
            sport: sport,
            countryCode: "FR",
            gender: .male,
            category: nil,
            type: nil,
            year: 2025
        )
        let phase = CompetitionPhase(
            name: "Regular Season",
            type: nil
        )
        let group = CompetitionGroup(
            id: "group-1",
            name: "Group A",
            competition: competition,
            phase: phase
        )
        
        return Team(
            id: id,
            name: name,
            number: nil,
            club: club,
            competition: competition,
            groups: [group]
        )
    }
}
