//
//  Game.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

/// Game model based on the OpenAPI schema.
/// Represents a game/match between two teams with its associated competition group, venue, and scores.
///
/// Schema reference: `#/components/schemas/Game` in `openapi.json`
struct Game: Identifiable, Codable {
    /// Unique game identifier (required)
    let id: String

    /// Competition group this game belongs to (required)
    let group: CompetitionGroup

    /// Unix timestamp in milliseconds for game start time (required)
    let startTime: UInt64

    /// First team (treated as home team) (required)
    let team1: Team

    /// Second team (treated as away team) (required)
    let team2: Team

    /// Whether the game has been played (required)
    let played: Bool

    /// Whether a snapshot has been requested for this game (required)
    let snapshotRequested: Bool

    /// Optional score for team1
    let team1Score: UInt32?

    /// Optional score for team2
    let team2Score: UInt32?

    /// Optional venue where the game is played
    let venue: Venue?

    /// Optional period/quarter number (for games in progress)
    let period: UInt32?

    /// Converts the startTime timestamp (milliseconds) to a Swift Date
    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(startTime) / 1000.0)
    }
}

// MARK: - Preview Helpers

extension Game {
    /// Preview game with AS Monaco vs ASVEL, with venue
    static var previewWithVenue: Game {
        createPreviewGame(
            id: "game-1",
            team1: .previewASM,
            team2: .previewASVEL,
            startTime: 1_736_899_200_000,  // January 15, 2025 7:30 PM UTC
            venue: createPreviewVenue()
        )
    }

    /// Preview game without venue
    static var previewWithoutVenue: Game {
        createPreviewGame(
            id: "game-2",
            team1: .previewBCM,
            team2: .previewCHB,
            startTime: 1_736_985_600_000,  // January 16, 2025 7:30 PM UTC
            venue: nil
        )
    }

    /// Preview game with long team names (for truncation testing)
    static var previewLongNames: Game {
        createPreviewGame(
            id: "game-3",
            team1: createPreviewTeam(id: "LONG1", name: "Very Long Team Name That Should Truncate"),
            team2: createPreviewTeam(
                id: "LONG2", name: "Another Extremely Long Team Name For Testing"),
            startTime: 1_737_072_000_000,  // January 17, 2025 7:30 PM UTC
            venue: createPreviewVenue(
                name: "Very Long Venue Name That Should Also Truncate Properly")
        )
    }

    // MARK: - Private Helpers

    private static func createPreviewGame(
        id: String,
        team1: Team,
        team2: Team,
        startTime: UInt64,
        venue: Venue?
    ) -> Game {
        let sport = Sport.basketball
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

        return Game(
            id: id,
            group: group,
            startTime: startTime,
            team1: team1,
            team2: team2,
            played: false,
            snapshotRequested: false,
            team1Score: nil,
            team2Score: nil,
            venue: venue,
            period: nil
        )
    }

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

    private static func createPreviewVenue(name: String = "Salle Gaston Médecin") -> Venue {
        let location = Location(
            street: "1 Avenue des Castelans",
            city: "Monaco",
            postalCode: "98000",
            countryCode: "MC",
            lat: 43.7278,
            lng: 7.4156
        )

        return Venue(
            id: "venue-1",
            name: name,
            secondaryName: nil,
            location: location
        )
    }
}
