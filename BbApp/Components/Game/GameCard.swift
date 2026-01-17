//
//  GameCard.swift
//  BbApp
//
//  Created on 15/01/2026.
//

import SwiftUI

/// A compact game card component used throughout the application to display both upcoming and past games.
/// This card is distinct from `FeaturedGameCard` - it's designed for game lists with a subtle gold gradient.
///
/// The card displays:
/// - Team logos and names on either side (48px logos)
/// - Game date/time (upcoming) or scores (past) in the center
/// - Venue location in a bottom strip (when available)
struct GameCard: View {
    /// The game to display
    let game: Game

    /// Force upcoming game display mode (ignores game.played)
    var showAsUpcoming: Bool = false

    var body: some View {

        VStack {
            HStack(spacing: Spacing.medium) {
                // Left team (team1)
                TeamView(
                    team: game.team1
                )
                .fontWeight(winner == .team1 ? .bold : .regular)
                .frame(maxWidth: .infinity)

                Group {
                    // Center content
                    if shouldShowPastMode {
                        pastGameCenterSection
                    } else {
                        upcomingGameCenterSection
                    }
                }
                .frame(maxWidth: .infinity)

                // Right team (team2)
                TeamView(
                    team: game.team2
                )
                .fontWeight(winner == .team2 ? .bold : .regular)
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, Spacing.medium)
            .padding(.top, Spacing.medium)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            if let venue = game.venue {
                VenueBarView(venue: venue)
                    .foregroundStyle(Color.mediumGray)
                    .backgroundStyle(Color.black.opacity(0.1))
            }
        }
        .frame(height: 130)
        .background {
            // Gold gradient background
            LinearGradient(
                colors: [
                    Color.tertiaryGold.opacity(0.03),
                    Color.tertiaryGold.opacity(0.12),
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        .overlay {
            if shouldShowPastMode, let winner {
                WinnerEdgeStrip()
                    .frame(
                        maxWidth: .infinity,
                        alignment: winner == .team1 ? .leading : .trailing
                    )
            }
        }
        .cornerRadius(CornerRadius.card)
        .clipShape(RoundedRectangle(cornerRadius: CornerRadius.card))
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabel)
    }

    // MARK: - Private Views

    /// Center section for upcoming games showing date and time
    private var upcomingGameCenterSection: some View {
        VStack(spacing: 0) {
            // Day number
            Text(dayNumber)
                .font(.headlineLarge())
                .foregroundColor(.textPrimary)

            // Month name
            Text(monthName)
                .font(.bodyMedium)
                .foregroundColor(.textSecondary)

            // Time pill
            Text(timeString)
                .font(.bodyMedium)
                .foregroundColor(Color.white)
                .padding(.horizontal, Spacing.small)
                .padding(.vertical, Spacing.xs)
                .background(Color.tertiaryGold)
                .cornerRadius(CornerRadius.pill)
                .padding(.top, Spacing.small)
        }
    }

    /// Center section for past games showing scores and date
    private var pastGameCenterSection: some View {
        VStack(spacing: Spacing.small) {
            // Scores
            HStack(spacing: Spacing.xs) {
                ScoreView(
                    score: game.team1Score ?? 0,
                    isWinner: winner == .team1
                )

                Text("-")
                    .font(.headlineMedium())

                ScoreView(
                    score: game.team1Score ?? 0,
                    isWinner: winner == .team2
                )
            }

            // Date
            Text(pastGameDateString)
                .font(.bodySmall)
                .foregroundColor(.textPrimary)
                .padding(.horizontal, Spacing.small)
                .padding(.vertical, Spacing.xs)
                .background(Color.mediumGray.opacity(0.1))
                .clipShape(.capsule)
        }
        .foregroundColor(.textSecondary)
    }

    // MARK: - Private Helpers

    /// Determines if past game mode should be shown
    private var shouldShowPastMode: Bool {
        if showAsUpcoming {
            return false
        }
        return game.played && game.team1Score != nil && game.team2Score != nil
    }

    /// Determines the winner of the game (nil for ties)
    private var winner: Winner? {
        guard let score1 = game.team1Score, let score2 = game.team2Score else {
            return nil
        }
        if score1 > score2 {
            return .team1
        } else if score2 > score1 {
            return .team2
        } else {
            return nil  // Tie
        }
    }

    /// Day number formatted as "d" (e.g., "13")
    private var dayNumber: String {
        game.date.formatted(.dateTime.day())
    }

    /// Month name formatted as "MMM" (e.g., "May")
    private var monthName: String {
        game.date.formatted(.dateTime.month(.abbreviated))
    }

    /// Time formatted as locale-aware short time (e.g., "6:52 PM")
    private var timeString: String {
        game.date.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated)).minute(.twoDigits))
    }

    /// Date formatted for past games (e.g., "May 10")
    private var pastGameDateString: String {
        game.date.formatted(.dateTime.month(.abbreviated).day())
    }

    /// Comprehensive accessibility label for the game card
    private var accessibilityLabel: String {
        if shouldShowPastMode {
            // Past game format: "Team1 Score, Team2 Score. Winner wins. Date at Venue"
            guard let score1 = game.team1Score, let score2 = game.team2Score else {
                return "\(game.team1.name) vs \(game.team2.name), \(pastGameDateString)"
            }

            var label = "\(game.team1.name) \(score1), \(game.team2.name) \(score2)."

            if let winner = winner {
                let winnerName = winner == .team1 ? game.team1.name : game.team2.name
                label += " \(winnerName) wins."
            } else {
                label += " Game tied at \(score1)."
            }

            label += " \(pastGameDateString)"

            if let venue = game.venue {
                label += " at \(venue.name)"
            }

            return label
        } else {
            // Upcoming game format: "Team1 vs Team2, Month Day at Time at Venue"
            var label =
                "\(game.team1.name) vs \(game.team2.name), \(monthName) \(dayNumber) at \(timeString)"

            if let venue = game.venue {
                label += " at \(venue.name)"
            }

            return label
        }
    }

    /// Winner enumeration
    private enum Winner {
        case team1
        case team2
    }
}

// MARK: - Previews

#Preview("Upcoming Game") {
    GameCard(game: .previewUpcoming)
        .padding()
}

#Preview("Past Game with Winner") {
    GameCard(game: .previewPastWithWinner)
        .padding()
}

#Preview("Past Game Tied") {
    GameCard(game: .previewPastTied)
        .padding()
}

#Preview("Past Game No Venue") {
    GameCard(game: .previewPastNoVenue)
        .padding()
}

#Preview("All States") {
    ScrollView {
        VStack(spacing: Spacing.medium) {
            GameCard(game: .previewUpcoming)
            GameCard(game: .previewPastWithWinner)
            GameCard(game: .previewPastTied)
            GameCard(game: .previewPastNoVenue)
            GameCard(game: .previewLongNames)
        }
        .padding()
    }
}
