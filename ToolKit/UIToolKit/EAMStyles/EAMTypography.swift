//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMTypography.swift
//  EAMNext
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 08/09/24.
//

import SwiftUI

enum EAMTypographyType {
    case displayLarge
    case displayMedium
    case displaySmall
    case headlineLarge
    case headlineMedium
    case headlineSmall
    case headlineMMedium
    case headlineMSmall
    case titleLarge
    case title
    case titleSmall
    case labelLarge
    case labelMedium
    case labelSmall
    case bodyBold
    case bodyMax
    case bodyLarge
    case bodyMedium
    case bodySmall
    case body
}

struct EAMTypography {
    
    var size: CGFloat
    var lineHeight: CGFloat
    var weight: Font.Weight
    

    static let displayLarge = EAMTypography(size: 57, lineHeight: 64, weight: .regular)
    static let displayMedium = EAMTypography(size: 45, lineHeight: 52, weight: .regular)
    static let displaySmall = EAMTypography(size: 36, lineHeight: 44, weight: .regular)

    static let headlineLarge = EAMTypography(size: 32, lineHeight: 40, weight: .regular)
    static let headlineMedium = EAMTypography(size: 28, lineHeight: 36, weight: .regular)
    static let headlineSmall = EAMTypography(size: 24, lineHeight: 32, weight: .regular)
    
    static let headlineMMedium = EAMTypography(size: 28, lineHeight: 36, weight: .medium)
    static let headlineMSmall = EAMTypography(size: 24, lineHeight: 32, weight: .medium)

    static let titleLarge = EAMTypography(size: 22, lineHeight: 28, weight: .medium)
    static let title = EAMTypography(size: 20, lineHeight: 28, weight: .medium)
    static let titleSmall = EAMTypography(size: 18, lineHeight: 28, weight: .medium)

    static let labelLarge = EAMTypography(size: 14, lineHeight: 20, weight: .medium)
    static let labelMedium = EAMTypography(size: 12, lineHeight: 16, weight: .medium)
    static let labelSmall = EAMTypography(size: 11, lineHeight: 16, weight: .medium)

    static let bodyBold = EAMTypography(size: 16, lineHeight: 24, weight: .bold)
    static let bodyMax = EAMTypography(size: 20, lineHeight: 28, weight: .regular)
    static let body = EAMTypography(size: 18, lineHeight: 26, weight: .regular)
    static let bodyLarge = EAMTypography(size: 16, lineHeight: 24, weight: .regular)
    static let bodyMedium = EAMTypography(size: 14, lineHeight: 20, weight: .regular)
    static let bodySmall = EAMTypography(size: 12, lineHeight: 16, weight: .regular)

    // Custom initializer for dynamic values
    init(size: CGFloat, lineHeight: CGFloat, weight: Font.Weight) {
        self.size = size
        self.lineHeight = lineHeight
        self.weight = weight
    }
    
    // Computed property to convert to SwiftUI Font
    var font: Font {
        .system(size: size, weight: weight)
    }
    
    // Method to apply line height and return a Text view
    func styledText(_ text: String) -> some View {
        Text(text)
            .font(font)
            .lineSpacing(lineHeight - size) // Adjust line spacing based on lineHeight
    }
}
