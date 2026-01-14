//
//  MainTabView.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import SwiftUI

/// Main tab bar view providing navigation between app sections.
/// Uses native SwiftUI TabView with design system colors and styling.
struct MainTabView: View {
    /// Selected tab state - managed with @State for explicit control.
    /// Native TabView automatically persists tab content state when switching tabs.
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label(Tab.home.title, systemImage: Tab.home.systemImage)
                }
                .tag(Tab.home)
                .accessibilityLabel("Home")
        }
        .tint(Color.primaryRed)
        .toolbarBackground(Color.brandWhite, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

#Preview {
    MainTabView()
}
