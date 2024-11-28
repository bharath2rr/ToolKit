//
//  EAMButton.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 17/05/24.
//

import SwiftUI

struct EAMButton: View {
    
    enum ButtonType {
        case primary
        case primaryText
        case secondary
        case secondaryText
        case tertiary
        case floatingAction
        case floatingActionPrimary
        case floatingActionSecondary
        case floatingActionTertiary
        case plain
        case navigationItem
        case warning
        case toggle
    }

    let text: String
    var type: ButtonType?
    var typography: EAMTypographyType?
    var colorScheme: EAMColorScheme?
    var isFontText: Bool? = nil
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var padding: CGFloat = 15
    var isEnabled: Bool = true
    let action: () -> Void

    private var colors: EAMColors {
        EAMTheme.eamColors
    }

    init(
        text: String,
        type: ButtonType = .plain,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.type = type
        self.isEnabled = isEnabled
        self.action = action
    }
    
    init(
        text: String,
        type: ButtonType = .plain,
        colorScheme: EAMColorScheme? = nil,
        isFontText: Bool? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        padding: CGFloat = 15,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.type = type
        self.colorScheme = colorScheme
        self.isFontText = isFontText
        self.width = width
        self.height = height
        self.padding = padding
        self.isEnabled = isEnabled
        self.action = action
    }
    
    init(text: String,
         typography: EAMTypographyType = .bodyLarge,
         colorScheme: EAMColorScheme? = nil,
         isFontText: Bool? = nil,
         padding: CGFloat = 15,
         isEnabled: Bool = true,
         action: @escaping () -> Void) {
        self.text = text
        self.typography = typography
        self.colorScheme = colorScheme
        self.isFontText = isFontText
        self.isEnabled = isEnabled
        self.action = action
    }

    var body: some View {
        Group {
            if let type = type {
                switch type {
                case .primary:
                    primaryButton()
                case .primaryText:
                    primaryTextButton()
                case .secondary:
                    secondaryButton()
                case .secondaryText:
                    secondaryTextButton()
                case .tertiary:
                    tertiaryButton()
                case .floatingAction:
                    floatingActionButton()
                case .floatingActionSecondary:
                    floatingActionSecondaryButton()
                case .floatingActionTertiary:
                    floatingActionTertiaryButton()
                case .plain:
                    plainButton()
                case .navigationItem:
                    navigationItemButton()
                case .warning:
                    warningButton()
                case .toggle:
                    toggleButton()
                case .floatingActionPrimary:
                    floatingActionPrimaryButton()
                }
            } else if typography != nil {
                EAMDefaultButton(title: text, typography: .bodyLarge, colorScheme: colorScheme, isFontText: isFontText ?? false, action: action)
            } else {
                plainButton()
            }
        }
    }
   
    private func primaryButton() -> some View {
        EAMDefaultButton(style: .capsule(showBorder: ((colorScheme?.border) != nil) ? true : false),
                         title: text,
                         typography: .bodyMax,
                         colorScheme: colorScheme ?? .onPrimary,
                         width: width,
                         height: height,
                         isWidthInfinity: true,
                         padding: padding,
                         action: action).frame(maxWidth: .infinity)
    }

    
    private func primaryTextButton() -> some View {
        
        return EAMDefaultButton(
            title: text,
            typography: .title,
            colorScheme: colorScheme ?? .primaryText,
            isFontText: isFontText ?? false,
            isEnabled: isEnabled,
            cornerRadius: 10,
            padding: padding,
            action: action
        )
    }

    private func secondaryButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .bodyMedium,
                         colorScheme: colorScheme ?? .onSurfaceSecondary,
                         isFontText: isFontText ?? false,
                         isEnabled: isEnabled,
                         width: width,
                         height: height,
                         cornerRadius: 10,
                         isWidthInfinity: true,
                         padding: padding,
                         action: action)
    }

    private func secondaryTextButton() -> some View {
        EAMDefaultButton( title: text,typography: .title,
                          colorScheme: .primaryText,
                          width: width,
                          height: height,
                          isWidthInfinity: true,
                          padding: padding,
                          action: action)
    }
    
    private func tertiaryButton() -> some View {
        EAMDefaultButton(style: .capsule(),
                         title: text,
                         typography: .body,
                         colorScheme: colorScheme ?? .onSecondary,
                         width: width,
                         height: height,
                         padding: padding,
                         action: action)
    }
    
    private func floatingActionButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .bodyLarge,
                         colorScheme: colorScheme ?? .primaryText,
                         isFontText: isFontText ?? true, action: action)
        .background(Circle().fill(colorScheme?.background ?? EAMTheme.eamColors.surfaceVariant))
        .overlay(Circle().stroke(EAMTheme.eamColors.outline, lineWidth: 1))
        .padding(.horizontal, padding)
    }
    
    private func floatingActionPrimaryButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .bodyLarge,
                         colorScheme: colorScheme ?? .onPrimaryText,
                         isFontText: isFontText ?? true, action: action)
        .background(Circle().fill(EAMTheme.eamColors.primary))
        .padding(.horizontal, padding)
    }
    

    private func floatingActionSecondaryButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .bodyMax,
                         colorScheme: isEnabled ? EAMColorScheme(foreground: EAMTheme.eamColors.outline) :  EAMColorScheme(foreground: EAMTheme.eamColors.onSurface),
                         isFontText: isFontText ?? true,
                         action: action)
        .background(Circle().fill(isEnabled ? EAMTheme.eamColors.outlineVariant : EAMTheme.eamColors.surfaceContainerHigh))
    }
    
    private func floatingActionTertiaryButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .bodyLarge,
                         colorScheme: colorScheme ?? EAMColorScheme(foreground: EAMTheme.eamColors.onSurface),
                         isFontText: isFontText ?? true,
                         isEnabled: isEnabled,
                         padding: padding,
                         action: action)
        .background(Circle().fill(EAMTheme.eamColors.secondaryContainer))
    }
    

    private func plainButton() -> some View {
        EAMDefaultButton(style: .plain,
                         title: text,
                         colorScheme: EAMColorScheme(foreground: EAMTheme.eamColors.onSurface),
                         isFontText: isFontText ?? false,
                         action: action)
    }

    private func navigationItemButton() -> some View {
        EAMDefaultButton(style: .plain, title: text, typography: .body, colorScheme: .primaryText, action: action)
    }
    
    private func warningButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .bodyMax,
                         colorScheme: EAMColorScheme(foreground: orangeColor),
                         isFontText: isFontText ?? true,
                         cornerRadius: 10,
                         action: action)
    }
    
    private func toggleButton() -> some View {
        EAMDefaultButton(title: text,
                         typography: .headlineMedium,
                         colorScheme: colorScheme ?? .primaryText,
                         isFontText: isFontText ?? true,
                         cornerRadius: 10,
                         padding: padding,
                         action: action)
    }
}
