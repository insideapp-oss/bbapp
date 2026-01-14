//
//  Tab.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import Foundation

/// Tab selection enum for type-safe tab navigation.
/// Provides a type-safe way to manage tab selection and configuration.
enum Tab: Int, CaseIterable {
    case home = 0

    /// Display title for the tab.
    var title: String {
        switch self {
        case .home:
            return "Home"
        }
    }

    /// SF Symbol name for the tab icon.
    var systemImage: String {
        switch self {
        case .home:
            return "house.fill"
        }
    }
}
