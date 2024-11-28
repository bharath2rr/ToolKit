//
//  ContentView.swift
//  EAMText
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 08/09/24.
//

import SwiftUI

struct EAMText: View {
    
    enum TextType {
        case plain
        case primary
        case onPrimary
        case secondary
        case navigationTitle
        case primaryListItem
        case secondaryListItem
        case secondaryBoldListItem
        case multilineCenter
        case plainLarge
    }

    let text: String
    var typography: EAMTypographyType?
    var type: TextType?
    var isFontText: Bool = false

    init(text: String, isFontText: Bool = false) {
        self.text = text
        self.isFontText = isFontText
    }
    
    // Custom initializer for typography
    init(text: String, typography: EAMTypographyType, isFontText: Bool = false) {
        self.text = text
        self.typography = typography
        self.isFontText = isFontText
    }
    
    // Custom initializer for type
    init(text: String, type: TextType, isFontText: Bool = false) {
        self.text = text
        self.type = type
        self.isFontText = isFontText
    }

    var body: some View {
        Group {
            if let textType = type {
                switch textType {
                case .plain:
                    PlainText(text: text, isFontText: isFontText)
                case .primary:
                    PrimaryText(text: text)
                case .onPrimary:
                    OnPrimaryText(text: text)
                case .secondary:
                    SecondaryText(text: text)
                case .navigationTitle:
                    NavigationTitleText(text: text)
                case .primaryListItem:
                    PrimaryListItem(text: text)
                case .secondaryListItem:
                    SecondaryListItem(text: text)
                case .secondaryBoldListItem:
                    SecondaryBoldListItem(text: text)
                case .multilineCenter:
                    MultilineCenter(text: text)
                case .plainLarge:
                    PlainLargeText(text: text)
                }
            } else if let typography = typography {
                TypographyText(text: text, type: typography, isFontText: isFontText)
            } else {
                PlainText(text: text, isFontText: isFontText)
            }
        }
    }
    
    private struct TypographyText: View {
        let text: String
        let type: EAMTypographyType
        let isFontText: Bool
        
        var body: some View {
            let typography: EAMTypography
            let colorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)

            switch type {
            case .displayLarge:
                typography = .displayLarge
            case .displayMedium:
                typography = .displayMedium
            case .displaySmall:
                typography = .displaySmall
            case .headlineLarge:
                typography = .headlineLarge
            case .headlineMedium:
                typography = .headlineMedium
            case .headlineSmall:
                typography = .headlineSmall
            case .headlineMMedium:
                typography = .headlineMMedium
            case .headlineMSmall:
                typography = .headlineMSmall
            case .titleLarge:
                typography = .titleLarge
            case .title:
                typography = .title
            case .titleSmall:
                typography = .titleSmall
            case .labelLarge:
                typography = .labelLarge
            case .labelMedium:
                typography = .labelMedium
            case .labelSmall:
                typography = .labelSmall
            case .bodyBold:
                typography = .bodyBold
            case .bodyMax:
                typography = .bodyMax
            case .bodyLarge:
                typography = .bodyLarge
            case .bodyMedium:
                typography = .bodyMedium
            case .bodySmall:
                typography = .bodySmall
            case .body:
                typography = .body // Default case
            }
            return EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme, isFontText: isFontText)
        }
    }

    private struct PlainText: View {
        let text: String
        let isFontText: Bool
        let typography: EAMTypography = .bodyLarge
        let colorScheme  = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface, background: EAMTheme.eamColors.surface)
        
        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme, isFontText: isFontText)
        }
    }
    
    private struct PlainLargeText: View {
        let text: String
        let typography: EAMTypography = .bodyMax
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme, padding: 10)
        }
    }
    
    private struct PrimaryText: View {
        let text: String
        let typography: EAMTypography = .titleSmall
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.primary, background: nil, border: nil)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme)
        }
    }
    
    private struct OnPrimaryText: View {
        let text: String
        let typography: EAMTypography = .bodyLarge
        let colorScheme: EAMColorScheme = .onPrimary

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme)
        }
    }

    private struct SecondaryText: View {
        let text: String
        let typography: EAMTypography = .bodyLarge
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.primary, background: nil, border: nil)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme)
        }
    }

    private struct NavigationTitleText: View {
        let text: String
        let typography: EAMTypography = .titleSmall
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)

        var body: some View {
            EAMDefaultText(text: text, typography: typography, colorScheme: colorScheme, padding: 0)
        }
    }

    private struct PrimaryListItem: View {
        let text: String
        let typography: EAMTypography = .bodyLarge
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme, padding: 2)
        }
    }
    
    private struct SecondaryListItem: View {
        let text: String
        let typography: EAMTypography = .bodyLarge
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme, padding: 6)
        }
    }
    
    private struct SecondaryBoldListItem: View {
        let text: String
        let typography: EAMTypography = .bodyBold
        let colorScheme: EAMColorScheme = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme, padding: 5)
        }
    }
    
    private struct MultilineCenter: View {
        let text: String
        let typography: EAMTypography = .bodyMax
        let colorScheme  = EAMColorScheme(foreground: EAMTheme.eamColors.onSurface, background: .clear)

        var body: some View {
            EAMDefaultText(text: text, style: .plain, typography: typography, colorScheme: colorScheme)
                .multilineTextAlignment(.center)
        }
    }
    
}
