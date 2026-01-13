//
//  Color+Hex.swift
//  BbApp
//
//  Created on 13/01/2026.
//

import SwiftUI

extension Color {
    /// Creates a Color from a hexadecimal string.
    ///
    /// Supports 6-digit hex codes with or without the `#` prefix.
    /// Invalid hex strings will return a fallback color (blue) to prevent crashes.
    ///
    /// - Parameter hex: A hexadecimal color string (e.g., "#DA2F16" or "DA2F16")
    /// - Returns: A Color instance, or a fallback color if the hex string is invalid
    ///
    /// Example:
    /// ```swift
    /// let red = Color(hex: "#DA2F16")
    /// let blue = Color(hex: "0066FF")
    /// ```
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RRGGBB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // RRGGBBAA (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            // Invalid hex string - return fallback color (blue)
            (a, r, g, b) = (255, 0, 0, 255)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
