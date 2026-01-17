//
//  VenueBarView.swift
//  BbApp
//
//  Created on 15/01/2026.
//

import SwiftUI

/// Reusable venue bar for location details.
struct VenueBarView: View {
    let venue: Venue

    var body: some View {
        Label(venue.name, systemImage: "location.fill")
            .font(.bodySmall)
            .lineLimit(1)
            .padding(.horizontal, Spacing.medium)
            .padding(.vertical, Spacing.xs)
            .frame(maxWidth: .infinity)
            .background()
    }
}

// MARK: - Previews

#Preview("Default") {
    VenueBarView(venue: Game.previewWithVenue.venue!)
        .foregroundStyle(Color.mediumGray)
        .backgroundStyle(Color.black.opacity(0.1))
        .padding()
}
