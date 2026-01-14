//
//  FeaturedGameCard.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import SwiftUI

/// A featured game card component that prominently displays upcoming games.
/// This card appears on the Home screen and serves as the visual focal point of the carousel.
///
/// The card displays:
/// - Team logos and names on either side (75px logos)
/// - Game date and time prominently in the center
/// - Venue location in a bottom strip (when available)
struct FeaturedGameCard: View {
    /// The game to display
    let game: Game

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                colors: [
                    Color.primaryRed.opacity(0.8),
                    Color.secondaryRed.opacity(0.8),
                ],
                startPoint: .leading,
                endPoint: .trailing
            )

            // Main content
            HStack(spacing: Spacing.medium) {
                // Left team (team1)
                teamSection(team: game.team1)

                Spacer()

                // Center date section
                dateSection

                Spacer()

                // Right team (team2)
                teamSection(team: game.team2)
            }
            .padding(Spacing.medium)

            // Location strip overlay (bottom)
            if let venue = game.venue {
                VStack {
                    Spacer()
                    locationStrip(venue: venue)
                }
            }
        }
        .frame(height: 200)
        .cornerRadius(CornerRadius.card)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabel)
    }

    // MARK: - Private Views

    /// Team section displaying logo and name
    private func teamSection(team: Team) -> some View {
        VStack(spacing: Spacing.small) {
            TeamLogo(team: team, size: .large)

            Text(team.name)
                .font(.bodyMedium)
                .fontWeight(.semibold)
                .foregroundColor(.textOnDark)
                .lineLimit(1)
        }
    }

    /// Center date section with day, month, and time pill
    private var dateSection: some View {
        VStack(spacing: Spacing.xs) {
            // Day number
            Text(dayNumber)
                .font(.headlineLarge())
                .foregroundColor(.textOnDark)

            // Month
            Text(monthName)
                .font(.bodyMedium)
                .foregroundColor(.textOnDark.opacity(0.8))

            // Time pill
            Text(timeString)
                .font(.bodyMedium)
                .foregroundColor(.textOnDark)
                .padding(.horizontal, Spacing.small)
                .padding(.vertical, Spacing.xs)
                .background(Color.tertiaryGold)
                .cornerRadius(CornerRadius.pill)
        }
    }

    /// Location strip at the bottom
    private func locationStrip(venue: Venue) -> some View {
        HStack(spacing: Spacing.xs) {
            Image(systemName: "mappin")
                .foregroundColor(.textOnDark)

            Text(venue.name)
                .font(.bodyMedium)
                .foregroundColor(.textOnDark)
                .lineLimit(1)
        }
        .padding(.horizontal, Spacing.medium)
        .padding(.vertical, Spacing.small)
        .frame(maxWidth: .infinity)
        .background(Color.brandBlack.opacity(0.4))
    }

    // MARK: - Private Helpers

    /// Day number formatted as "d" (e.g., "15")
    private var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: game.date)
    }

    /// Month name formatted as "MMMM" (e.g., "January")
    private var monthName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: game.date)
    }

    /// Time formatted as locale-aware short time (e.g., "7:30 PM")
    private var timeString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: game.date)
    }

    /// Comprehensive accessibility label for the game card
    private var accessibilityLabel: String {
        var label =
            "\(game.team1.name) vs \(game.team2.name), \(monthName) \(dayNumber) at \(timeString)"
        if let venue = game.venue {
            label += " at \(venue.name)"
        }
        return label
    }
}

// MARK: - Previews

#Preview("With Venue") {
    FeaturedGameCard(game: .previewWithVenue)
        .padding()
}

#Preview("Without Venue") {
    FeaturedGameCard(game: .previewWithoutVenue)
        .padding()
}

#Preview("Long Team Names") {
    FeaturedGameCard(game: .previewLongNames)
        .padding()
}

#Preview("Multiple Cards") {
    ScrollView {
        VStack(spacing: Spacing.medium) {
            FeaturedGameCard(game: .previewWithVenue)
            FeaturedGameCard(game: .previewWithoutVenue)
            FeaturedGameCard(game: .previewLongNames)
        }
        .padding()
    }
}
