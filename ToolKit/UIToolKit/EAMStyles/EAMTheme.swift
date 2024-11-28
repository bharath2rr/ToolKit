//
//  EAMTheme.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 20/05/24.
//


import SwiftUI

let isPhone: Bool = (UIDevice.current.userInterfaceIdiom == .phone) ? true : false

class EAMTheme: ObservableObject {
    
    @Published var colors: EAMColors
    private init(colors: EAMColors) {
        self.colors = colors
    }
    
    static let shared: EAMTheme = {
        return EAMTheme(colors: EAMThemeKey.defaultValue)
    }()
    
    static public var eamColors: EAMColors {
        return shared.colors
    }
    
    static public func getSwitchColor(enable: Bool) -> EAMColorScheme {
        let foregroundColor = (enable) ? EAMTheme.eamColors.primary : EAMTheme.eamColors.onSurfaceVariant
        return EAMColorScheme(foreground: foregroundColor)
    }
}

struct EAMThemeKey: EnvironmentKey {
    static let defaultValue: EAMColors = LightColors
}
