//
//  ScoreView.swift
//  BbApp
//
//  Created on 16/01/2026.
//

import SwiftUI

struct ScoreView: View {
    let score: UInt32
    let isWinner: Bool

    var body: some View {
        Text("\(score)")
            .font(.headlineMedium())
            .fontWeight(isWinner ? .bold : .regular)
            .foregroundColor(isWinner ? .primaryRed : .textSecondary)
    }
}
