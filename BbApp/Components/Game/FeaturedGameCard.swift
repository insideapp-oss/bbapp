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
                    Color.primaryRed,
                    Color.secondaryRed
                ],
                startPoint: .leading,
                endPoint: .trailing
            )

            // Main content
            VStack {
                HStack(spacing: Spacing.medium) {
                    // Left team (team1)
                    TeamView(team: game.team1)
                        .frame(maxWidth: .infinity)

                    // Center date section
                    dateSection
                        .padding(.horizontal, Spacing.medium)

                    // Right team (team2)
                    TeamView(team: game.team2)
                        .frame(maxWidth: .infinity)
                }
                .teamLogoSize(.large)
                .padding(.horizontal, Spacing.medium)
                .padding(.top, Spacing.medium)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                // Location strip overlay (bottom)
                if let venue = game.venue {
                    VenueBarView(venue: venue)
                        .foregroundStyle(Color.textOnDark)
                        .backgroundStyle(Color.black.opacity(0.4))
                }
            }
        }
        .foregroundStyle(Color.white)
        .frame(height: 200)
        .cornerRadius(CornerRadius.card)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabel)
    }

    // MARK: - Private Views

    /// Center date section with day, month, and time pill
    private var dateSection: some View {
        VStack(spacing: Spacing.medium) {
            // Date: Day number + Month name on same line
            VStack(spacing: 0) {
                Text(dayNumber)
                    .font(.headlineLarge())
                    .foregroundColor(.textOnDark)

                Text(monthName)
                    .font(.bodyMedium)
                    .foregroundColor(.textOnDark.opacity(0.8))
            }

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

    // MARK: - Private Helpers

    /// Day number formatted as "d" (e.g., "15")
    private var dayNumber: String {
        game.date.formatted(.dateTime.day())
    }

    /// Month name formatted as "MMM" (e.g., "May")
    private var monthName: String {
        game.date.formatted(.dateTime.month(.abbreviated))
    }

    /// Time formatted as locale-aware short time (e.g., "7:30 PM")
    private var timeString: String {
        game.date.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated)).minute(.twoDigits))
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
