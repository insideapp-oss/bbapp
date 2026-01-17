//
//  TeamView.swift
//  BbApp
//
//  Created on 16/01/2026.
//

import SwiftUI

/// Team section view for GameCard displaying logo and name.
struct TeamView: View {
    let team: Team

    var body: some View {
        VStack(spacing: Spacing.small) {
            TeamLogo(team: team)

            Text(team.name)
                .font(.bodySmall)
                .lineLimit(1)
        }
        .multilineTextAlignment(.center)
    }
}
