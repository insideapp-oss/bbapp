//
//  ContentView.swift
//  BbApp
//
//  Created by Mickael Laloum on 13/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.custom("Montserrat-Bold", size: 24))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
