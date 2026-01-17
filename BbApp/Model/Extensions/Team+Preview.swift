//
//  Team+Preview.swift
//  BbApp
//
//  Created on 14/01/2026.
//

import Foundation

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
