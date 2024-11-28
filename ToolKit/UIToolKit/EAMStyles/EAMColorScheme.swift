//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMColorScheme.swift
//  EAMNext
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 17/09/24.
//

import SwiftUI

struct EAMColorScheme {
    var foreground: Color? = nil
    var background: Color? = nil
    var border: Color? = nil

    private var colors: EAMColors {
        EAMTheme.eamColors
    }

    // Predefined color schemes
    static let primary = EAMColorScheme(foreground: EAMTheme.eamColors.primary, background: EAMTheme.eamColors.onPrimary)
    static let primaryText = EAMColorScheme(foreground: EAMTheme.eamColors.primary)
    static let onPrimaryText = EAMColorScheme(foreground: EAMTheme.eamColors.onPrimary)

    static let onPrimary = EAMColorScheme(foreground: EAMTheme.eamColors.onPrimary, background: EAMTheme.eamColors.primary)
    
    static let secondary = EAMColorScheme(foreground: EAMTheme.eamColors.secondary, background: EAMTheme.eamColors.onSecondary)
    
    static let onSecondary = EAMColorScheme(foreground: EAMTheme.eamColors.onSecondary, background: EAMTheme.eamColors.secondary)
    
    static let onSecondaryOutlineVariant = EAMColorScheme(foreground: EAMTheme.eamColors.onSecondaryContainer, background: EAMTheme.eamColors.outlineVariant)
    
    static let secondaryContainer = EAMColorScheme(foreground: EAMTheme.eamColors.secondary, background: EAMTheme.eamColors.onSecondaryContainer )
    
    static let onSecondaryContainer = EAMColorScheme(foreground: EAMTheme.eamColors.onSecondary, background: EAMTheme.eamColors.secondary)
    
    static let surface = EAMColorScheme(foreground: EAMTheme.eamColors.surface, background: EAMTheme.eamColors.onSurface)
    
    static let onSurface = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface, background: EAMTheme.eamColors.surface)
    static let onSurfaceSecondary = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface, background: EAMTheme.eamColors.outlineVariant)
   
    static let surfaceVariant = EAMColorScheme(foreground: EAMTheme.eamColors.surfaceVariant,background: EAMTheme.eamColors.onSurfaceVariant)
    
    static let onSurfaceVariant = EAMColorScheme(foreground: EAMTheme.eamColors.onSurfaceVariant, background: EAMTheme.eamColors.surfaceVariant)
    
    static let outline = EAMColorScheme(foreground: EAMTheme.eamColors.outline, background: EAMTheme.eamColors.outlineVariant)
    
    static let outlineVariant = EAMColorScheme(foreground: EAMTheme.eamColors.outlineVariant, background: EAMTheme.eamColors.outline)
    
    static let surfaceContainerLowest = EAMColorScheme(background: EAMTheme.eamColors.surfaceContainerLowest)
    
    static let surfaceContainerLow = EAMColorScheme(background: EAMTheme.eamColors.surfaceContainerLow)
    
    static let surfaceContainer = EAMColorScheme(background: EAMTheme.eamColors.surfaceContainer)
    
    static let surfaceContainerHigh = EAMColorScheme(background: EAMTheme.eamColors.surfaceContainerHigh)
    
    static let surfaceContainerHighest = EAMColorScheme(background: EAMTheme.eamColors.surfaceContainerHighest)

    func copy(
        foreground: Color? = nil,
        background: Color? = nil,
        border: Color? = nil
    ) -> EAMColorScheme {
        return EAMColorScheme(
            foreground: foreground ?? self.foreground,
            background: background ?? self.background,
            border: border ?? self.border
        )
    }
    
    mutating func updateColorsFrom(_ other: EAMColorScheme) {
        self = other
    }
}

extension EAMColorScheme {
    func disabledIfNeeded(_ isDisabled: Bool) -> EAMColorScheme {
        isDisabled
            ? EAMColorScheme(
                foreground: Color((foreground?.toUIColor().withAlphaComponent(0.6)) ?? .clear),  // Dimmed text color
                background: Color((background?.toUIColor().withAlphaComponent(0.5)) ?? .clear),  // Dimmed background color
                border: Color((background?.toUIColor().withAlphaComponent(0.5)) ?? .clear)  // Dimmed border color
              )
            : self
    }
}
